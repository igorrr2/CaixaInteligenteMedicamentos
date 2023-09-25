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
        db.Execute("DELETE FROM Usuario");
        db.Execute("DROP TABLE IF EXISTS Usuario");
        db.CreateTable<Usuario>();
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
    public static void AtualizarUsuario(string idUsuario, string username, string email, string nomeCompleto)
    {
        string caminhoDB = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
        string nomeDB = "Usuario.db";
        string caminhoCompletoDB = System.IO.Path.Combine(caminhoDB, nomeDB);
        SQLiteConnection db;
        db = new SQLiteConnection(caminhoCompletoDB);

        var usuarioToUpdate = db.Table<Usuario>().FirstOrDefault(u => u.Id == idUsuario);
        if (usuarioToUpdate != null)
        {
            // Modificar os dados do usuário conforme necessário
            usuarioToUpdate.Username = username;
            usuarioToUpdate.Email = email;
            usuarioToUpdate.NomeCompleto = nomeCompleto;

            // Executar o comando de atualização
            db.Update(usuarioToUpdate);
        }
    }
}