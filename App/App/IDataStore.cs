using System.Collections.Generic;

namespace App
{
    /// <summary>
    /// Descreve os métodos para controlar o estado para alguns elementos.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IDataStore<T>
    {
        T Selected { get; }
        IReadOnlyCollection<T> State { get; }

        void Add(T data);
        void AddRange(IEnumerable<T> dataRange);
        void ClearSelected();
        void ClearState();
        void Pick(T data);
        void Remove(T data);
    }
}