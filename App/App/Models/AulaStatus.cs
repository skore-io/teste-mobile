using System.Collections.Generic;

namespace App.Models
{
    /// <summary>
    /// Possíveis status de uma aula.
    /// </summary>
    public static class AulaStatus
    {
        private const string _pendente = "NOT_STARTED";
        private const string _iniciado = "IN_PROGRESS";
        private const string _concluido = "COMPLETED";

        public static IEnumerable<string> Status { get; } = new List<string>
        {
            _pendente,
            _iniciado,
            _concluido
        };
    }
}
