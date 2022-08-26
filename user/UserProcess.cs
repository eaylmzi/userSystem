
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using user.Models;

namespace userApplication
{

    public class UserProcess
    {

        public string path = "Data Source=DESKTOP-VQJHFAN;Initial Catalog=userDatabase;Integrated Security=True";
        public bool addUser(string name, string password, string email, IFormFile png)
        {

            try
            {
                SqlConnection connection = new SqlConnection(path);
                connection.Open();
                SqlCommand command = new SqlCommand("addUser", connection);
                command.CommandType = CommandType.StoredProcedure;
                var extension = Path.GetExtension(png.FileName);
                var newImageName = Guid.NewGuid() + extension;
                var location = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images/", newImageName);
                var stream = new FileStream(location, FileMode.Create);
                png.CopyTo(stream);







                command.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = name;
                command.Parameters.AddWithValue("@Password", SqlDbType.NVarChar).Value = password;
                command.Parameters.AddWithValue("@Email", SqlDbType.NVarChar).Value = email;
                command.Parameters.AddWithValue("@Png", SqlDbType.NVarChar).Value = newImageName;
                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }


        }
        public List<User> readDatabaseToList()
        {
            SqlConnection connection = new SqlConnection(path);
            SqlCommand command = new SqlCommand("readAll", connection);
            List<User> userList = new List<User>();

            try
            {

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    User user = new User();
                    user.Name = reader[0].ToString();
                    user.Password = reader[1].ToString();
                    user.Email = reader[2].ToString();
                    user.Png = reader[3].ToString();
                    userList.Add(user);

                }
                reader.Close();
                connection.Close();
            }
            catch (Exception ex)
            {
                //now do nothing but later look at this
            }
            return userList;
        }
        public void deleteUser(string email)
        {
            SqlConnection connection = new SqlConnection(path);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("deleteUser", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@email", SqlDbType.NVarChar).Value = email;
                command.ExecuteNonQuery();
                connection.Close();



            }
            catch (Exception ex)
            {
                //SONRA DOLDRUULR KARDEŞ
            }
        }
    }
}


