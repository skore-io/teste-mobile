using Prism.Navigation;

namespace App.ViewModels
{
    public class SobrePageViewModel : ViewModelBase
    {
        public SobrePageViewModel(INavigationService navigationService) : base(navigationService)
        {
            Title = "Sobre";
        }
    }
}
