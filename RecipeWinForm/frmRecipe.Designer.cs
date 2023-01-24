namespace RecipeWinForm
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tblMain = new System.Windows.Forms.TableLayoutPanel();
            this.gRecipeList = new System.Windows.Forms.DataGridView();
            this.gBookMealRecipe = new System.Windows.Forms.DataGridView();
            this.btnNewRecipe = new System.Windows.Forms.Button();
            this.tblMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gBookMealRecipe)).BeginInit();
            this.SuspendLayout();
            // 
            // tblMain
            // 
            this.tblMain.ColumnCount = 2;
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblMain.Controls.Add(this.gRecipeList, 1, 0);
            this.tblMain.Controls.Add(this.gBookMealRecipe, 0, 0);
            this.tblMain.Controls.Add(this.btnNewRecipe, 0, 1);
            this.tblMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblMain.Location = new System.Drawing.Point(0, 0);
            this.tblMain.Name = "tblMain";
            this.tblMain.RowCount = 2;
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 36F));
            this.tblMain.Size = new System.Drawing.Size(800, 450);
            this.tblMain.TabIndex = 0;
            // 
            // gRecipeList
            // 
            this.gRecipeList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gRecipeList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gRecipeList.Location = new System.Drawing.Point(403, 3);
            this.gRecipeList.Name = "gRecipeList";
            this.gRecipeList.RowHeadersWidth = 51;
            this.gRecipeList.RowTemplate.Height = 29;
            this.gRecipeList.Size = new System.Drawing.Size(394, 408);
            this.gRecipeList.TabIndex = 1;
            // 
            // gBookMealRecipe
            // 
            this.gBookMealRecipe.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gBookMealRecipe.Dock = System.Windows.Forms.DockStyle.Top;
            this.gBookMealRecipe.Location = new System.Drawing.Point(3, 3);
            this.gBookMealRecipe.Name = "gBookMealRecipe";
            this.gBookMealRecipe.RowHeadersWidth = 51;
            this.gBookMealRecipe.RowTemplate.Height = 29;
            this.gBookMealRecipe.Size = new System.Drawing.Size(394, 408);
            this.gBookMealRecipe.TabIndex = 0;
            // 
            // btnNewRecipe
            // 
            this.btnNewRecipe.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnNewRecipe.Location = new System.Drawing.Point(3, 417);
            this.btnNewRecipe.Name = "btnNewRecipe";
            this.btnNewRecipe.Size = new System.Drawing.Size(394, 30);
            this.btnNewRecipe.TabIndex = 2;
            this.btnNewRecipe.Text = "New Recipe";
            this.btnNewRecipe.UseVisualStyleBackColor = true;
            // 
            // frmRecipe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tblMain);
            this.Name = "frmRecipe";
            this.Text = "Recipe";
            this.tblMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gBookMealRecipe)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tblMain;
        private DataGridView gRecipeList;
        private DataGridView gBookMealRecipe;
        private Button btnNewRecipe;
    }
}