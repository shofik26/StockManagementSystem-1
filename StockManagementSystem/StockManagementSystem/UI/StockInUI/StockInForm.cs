﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using StockManagementSystem.Models;
using StockManagementSystem.DAL;
using StockManagementSystem.BLL;

namespace StockManagementSystem.UI.StockInUI
{
    public partial class StockInForm : Form
    {
        public StockInForm()
        {
            InitializeComponent();
        }

        //Override form close button
        protected override void OnFormClosed(FormClosedEventArgs e)
        {
            MainForm.MainForm mainForm = new MainForm.MainForm();
            this.Hide();
            mainForm.Show();
        }


        Stockin stockin = new Stockin();
        StockinRepository stockinRepository = new StockinRepository();
        StockinManager stockinManager = new StockinManager();


        private void StockInForm_Load(object sender, EventArgs e)
        {
            //Load Company
            DataTable companydt = new DataTable();
            companydt = stockinRepository.LoadCompany();
            compannyBindingSource.DataSource = companydt;
            //companyComboBox.DataSource = companydt;
            companyComboBox.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            companyComboBox.AutoCompleteSource = AutoCompleteSource.ListItems;

            //Load Category
            DataTable categoryDt = new DataTable();
            categoryDt = stockinRepository.LoadCategory();
            categoryBindingSource.DataSource = categoryDt;
            //categoryComboBox.DataSource = categoryDt;
            categoryComboBox.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            categoryComboBox.AutoCompleteSource = AutoCompleteSource.ListItems;

        }


        private void categoryComboBox_TextChanged(object sender, EventArgs e)
        {
            //Item Load
            stockin.Id = Convert.ToInt32(itemComboBox.SelectedValue);
            stockin.CategoryId = Convert.ToInt32(categoryComboBox.SelectedValue);
            stockin.CompanyId = Convert.ToInt32(companyComboBox.SelectedValue);

            stockin.Company = companyComboBox.GetItemText(companyComboBox.SelectedItem);
            stockin.Category = categoryComboBox.GetItemText(categoryComboBox.SelectedItem);

            DataTable itemDt = new DataTable();
            itemDt = stockinRepository.LoadItem(stockin);
            itemComboBox.DataSource = itemDt;

            itemComboBox.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            itemComboBox.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private void itemComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            stockin.Id = Convert.ToInt32(itemComboBox.SelectedValue);
            stockin.CategoryId = Convert.ToInt32(categoryComboBox.SelectedValue);
            stockin.CompanyId = Convert.ToInt32(companyComboBox.SelectedValue);

            string constring = "server = DESKTOP-E1SJ59O; database = StockManagement; integrated security = true;";
            SqlConnection conn = new SqlConnection(constring);
            string query = @"select iv.Quantity, iv.Reorder from Items it inner join Inventory iv on it.Id = iv.itemId where it.CategoryId = "+stockin.CategoryId+" and it.CompanyId = "+stockin.CompanyId+" and it.Id = "+stockin.Id+"   ";
            SqlCommand command = new SqlCommand(query,conn);
            conn.Open();
            SqlDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                availableTextBox.Text = dr.GetValue(0).ToString();
                reorderTextBox.Text = dr.GetValue(1).ToString();
            }
            else
            {
                reorderTextBox.Text = "";
                availableTextBox.Text = "";
            }
            conn.Close();
        }

        private void SaveButton_Click(object sender, EventArgs e)
        {
            //stockin.SIQuantity = Convert.ToInt32(stockQuantityTextBox.Text);
            stockin.Company = companyComboBox.GetItemText(companyComboBox.SelectedItem);
            stockin.Category = categoryComboBox.GetItemText(categoryComboBox.SelectedItem);
            stockin.Item = itemComboBox.GetItemText(itemComboBox.SelectedItem);
            stockin.SIQuantity = stockQuantityTextBox.Text;
            stockin.ErrorText = stockQuantityLabel.Text;

            bool verify = stockinManager.IsVerified(stockin);
            if (verify)
            {
                MessageBox.Show("Field Must Not Be Empty!!");
                return;
            }


            bool error = stockinManager.IsError(stockin);
            if (error)
            {
                MessageBox.Show("Please Resolve Your Error!!");
                return;
            }


            bool isAdd = stockinManager.IsAdded(stockin);
            if (isAdd)
            {
                MessageBox.Show("Stock in successfully!!");
                stockQuantityTextBox.Clear();
                availableTextBox.Clear();
                reorderTextBox.Clear();
            }
        }

        private void stockQuantityTextBox_TextChanged(object sender, EventArgs e)
        {
            string temp = stockQuantityTextBox.Text;
            foreach (char c in temp)
            {
                if (char.IsDigit(c) == false)
                {
                    stockQuantityLabel.Text = "* Invalid quantity Number!!";
                    return;
                }

                stockQuantityLabel.Text = "";
            }

            if (string.IsNullOrWhiteSpace(temp))
            {
                stockQuantityLabel.Text = "* Invalid Quantity Number!!";
                return;
            }

            stockQuantityLabel.Text = "";
        }
      
    }
}
