using CaixaInteligente;
using CaixaInteligente.Models;
using SQLite;
using System.Collections.Generic;

internal static class UsuarioHelpers
{
    public static void SalvarUsuario(User user)
    {
        string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
        string nomeDB = "Usuario.db";
        string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
        SQLiteConnection db;
        db = new SQLiteConnection(caminhoCompletoDB);
        var usuario = new Usuario() { Id = user.Id, Username = user.Username, Password = user.Password, Email = user.Email, NomeCompleto = user.NomeCompleto };
        db.Insert(usuario);
    }

    public static void ApagarUsuario()
    {
        string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
        string nomeDB = "Usuario.db";
        string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
        SQLiteConnection db;
        db = new SQLiteConnection(caminhoCompletoDB);
        db.DeleteAll<Usuario>();
    }
    public static Usuario ObterUsuarioLogado()
    {
        string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
        string nomeDB = "Usuario.db";
        string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
        SQLiteConnection db;
        db = new SQLiteConnection(caminhoCompletoDB);
        List<Usuario> usuario = db.Table<Usuario>().ToList();
        return usuario[0];

    }
}