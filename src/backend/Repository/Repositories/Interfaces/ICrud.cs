using System.Collections.Generic;

namespace Repository.Repositories.Interfaces
{
    public interface ICrud<T>
    {
        T Inserir(T entidade);
        bool Alterar(T entidade);
        bool Excluir(T entidade);
        T RetornarPorId(int Id);
        IList<T> Consultar();
    }
}