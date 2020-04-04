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

        public MainPageViewModel(Faker<Aula> seeder, INavigationService navigationService)
            : base(navigationService)
        {
            Title = "Skore-IO Mobile";
            _seeder = seeder ?? throw new ArgumentNullException(nameof(seeder));
            ReseedAulas = new DelegateCommand(async () => await SeedData())
                .ObservesProperty(() => Aulas)
                .ObservesProperty(() => Refreshing);
            DeleteAula = new DelegateCommand<Aula>(RemoveAulaFromState)
                .ObservesProperty(() => Aulas);
            DeleteAll = new DelegateCommand(RemoveAllAulasFromState)
                .ObservesProperty(() => Aulas);
        }

        public DelegateCommand ReseedAulas { get; private set; }
        public DelegateCommand<Aula> DeleteAula { get; private set; }
        public DelegateCommand DeleteAll { get; private set; }

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

        private async Task SeedData()
        {
            Refreshing = true;

            await Task.Delay(3000);
            var result = _seeder.Generate(5);            

            Aulas.Clear();
            foreach (var aula in result)
            {
                Aulas.Add(aula);
            }

            Refreshing = false;
        }

        private void RemoveAulaFromState(Aula a) => Aulas.Remove(a);
        private void RemoveAllAulasFromState() => Aulas.Clear();
    }
}
