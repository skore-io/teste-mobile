using App.Models;
using App.ViewModels;
using App.Views;

using Bogus;
using Bogus.Extensions;

using Prism;
using Prism.Ioc;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]
namespace App
{
    public partial class App
    {
        /* 
         * The Xamarin Forms XAML Previewer in Visual Studio uses System.Activator.CreateInstance.
         * This imposes a limitation in which the App class must have a default constructor. 
         * App(IPlatformInitializer initializer = null) cannot be handled by the Activator.
         */
        public App() : this(null) { }

        public App(IPlatformInitializer initializer) : base(initializer) { }

        protected override async void OnInitialized()
        {
            InitializeComponent();

            await NavigationService.NavigateAsync("NavigationPage/MainPage");
        }

        protected override void RegisterTypes(IContainerRegistry containerRegistry)
        {
            containerRegistry.RegisterForNavigation<NavigationPage>();
            containerRegistry.RegisterForNavigation<MainPage, MainPageViewModel>();

            RegisterDataSeeders(containerRegistry);
        }

        private void RegisterDataSeeders(IContainerRegistry containerRegistry)
        {
            var fakerSummary = new Faker<Summary>()
                .RuleFor(s => s.Percentage, f => f.Random.Int(50, 100).OrNull(f, .25f));

            var fakerAula = new Faker<Aula>("pt_BR")
                .RuleFor(a => a.Summary, f => fakerSummary)
                .RuleFor(a => a.CompanyId, f => f.Random.Int(0, 200))
                .RuleFor(a => a.CreatedAt, f => f.Date.RecentOffset(7).ToUnixTimeSeconds())
                .RuleFor(a => a.Name, f => f.Commerce.ProductName())
                .RuleFor(a => a.Id, f => f.Random.Guid().ToString())
                .RuleFor(a => a.Status, f => f.PickRandom(AulaStatus.Status));

            containerRegistry.RegisterInstance(fakerAula);
        }
    }
}
