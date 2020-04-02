using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

using App.Models;

using Bogus;

using Prism.Navigation;

namespace App.ViewModels
{
    public class MainPageViewModel : ViewModelBase
    {
        private readonly Faker<Aula> _seeder;
        private readonly IDataStore<Aula> _store;

        public MainPageViewModel(Faker<Aula> seeder, IDataStore<Aula> store, INavigationService navigationService)
            : base(navigationService)
        {
            Title = "Skore-IO Mobile";
            _seeder = seeder ?? throw new ArgumentNullException(nameof(seeder));
            _store = store ?? throw new ArgumentNullException(nameof(store));
        }

        private ObservableCollection<Aula> _aulas = new ObservableCollection<Aula>();
        public ObservableCollection<Aula> Aulas
        {
            get { return _aulas; }
            set { SetProperty(ref _aulas, value); }
        }

        public override async void OnNavigatedTo(INavigationParameters parameters)
        {
            base.OnNavigatedTo(parameters);

            Refreshing = true;
            // HACK: Simulando um pequeno delay para dar a impressão que estamos buscando algo na API
            Func<Task> fetchAndAwaitTask = async () =>
            {
                await Task.Delay(1000);
                var result = _seeder.Generate(5);
                await Task.Delay(500);
                _store.AddRange(result);
            };
            await fetchAndAwaitTask.Invoke().ConfigureAwait(false);

            foreach (var aula in _store.State)
            {
                Aulas.Add(aula);
            }

            Refreshing = false;
        }
    }
}
