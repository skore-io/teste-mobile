using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

using App.Models;

using Bogus;

using Prism.Commands;
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
            ReseedAulas = new DelegateCommand(SeedData)
                .ObservesProperty(() => Aulas)
                .ObservesProperty(() => Refreshing);
            DeleteAula = new DelegateCommand<Aula>(RemoveAulaFromState)
                .ObservesProperty(() => Aulas);
        }

        public DelegateCommand ReseedAulas { get; private set; }
        public DelegateCommand<Aula> DeleteAula { get; private set; }

        private ObservableCollection<Aula> _aulas = new ObservableCollection<Aula>();
        public ObservableCollection<Aula> Aulas
        {
            get { return _aulas; }
            set { SetProperty(ref _aulas, value); }
        }

        public override void OnNavigatedTo(INavigationParameters parameters)
        {
            ReseedAulas.Execute();

            base.OnNavigatedTo(parameters);
        }

        private async void SeedData()
        {
            Refreshing = true;

            Aulas.Clear();
            await Task.Delay(1500);
            var result = _seeder.Generate(5);
            await Task.Delay(1500);
            foreach (var aula in result)
            {
                Aulas.Add(aula);
            }

            Refreshing = false;
        }

        private void RemoveAulaFromState(Aula a) => Aulas.Remove(a);
    }
}
