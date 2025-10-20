﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DbCon
    {
        public string ConnectionString => Con.ConnectionString;
        private SqlConnection Con;
        public DbCon()
        {
            Con = new SqlConnection(@"Data Source=Alyan_Kabir\SQLEXPRESS;Initial Catalog=CRUD;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        }

        public bool UDI(string qry)
        {
            try
            {
                Con.Open();
                SqlCommand cmd = new SqlCommand(qry, Con);
                bool r = cmd.ExecuteNonQuery() > 0;
                Con.Close();
                return r;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public DataTable Search(string qry)
        {
            try
            {
                Con.Open();
                SqlDataAdapter da = new SqlDataAdapter(qry, Con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Con.Close();
                return dt;
            }
            catch (Exception)
            {
                if (Con.State == ConnectionState.Open)
                    Con.Close();
                return new DataTable();
            }
        }

    }
}
