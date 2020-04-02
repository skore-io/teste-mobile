using System.Collections.Generic;

namespace App
{
    public class DataStore<T> : IDataStore<T>
    {
        protected readonly HashSet<T> _state = new HashSet<T>();
        public IReadOnlyCollection<T> State
        {
            get => _state;
        }

        protected T _selected = default;
        public T Selected
        {
            get => _selected;
        }

        public void Add(T data) => _state.Add(data);
        public void AddRange(IEnumerable<T> dataRange)
        {
            foreach (var data in dataRange)
            {
                Add(data);
            }
        }

        public void Remove(T data) => _state.Remove(data);

        public void Pick(T data) => _selected = data;

        public void ClearState() => _state.Clear();
        public void ClearSelected() => _selected = default;
    }
}
