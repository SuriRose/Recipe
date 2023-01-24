namespace RecipeWinForm
{
    partial class frmRecipeDetail
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
            this.lblRecipeName = new System.Windows.Forms.Label();
            this.lblNumOfCalories = new System.Windows.Forms.Label();
            this.lblNumOfIngredients = new System.Windows.Forms.Label();
            this.lblNumOfSteps = new System.Windows.Forms.Label();
            this.txtRecipeName = new System.Windows.Forms.TextBox();
            this.txtNumOfCalories = new System.Windows.Forms.TextBox();
            this.txtNumOfIngredients = new System.Windows.Forms.TextBox();
            this.txtNumOfSteps = new System.Windows.Forms.TextBox();
            this.lblCuisineType = new System.Windows.Forms.Label();
            this.lstCuisineType = new System.Windows.Forms.ComboBox();
            this.lblDateCreated = new System.Windows.Forms.Label();
            this.lblDatePublished = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.lblDateArchived = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tblButtons = new System.Windows.Forms.TableLayoutPanel();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.lblRecipeStatus = new System.Windows.Forms.Label();
            this.lstCreatedByUsers = new System.Windows.Forms.ComboBox();
            this.lblCreatedByUsers = new System.Windows.Forms.Label();
            this.gPrepStep = new System.Windows.Forms.DataGridView();
            this.gIngredientList = new System.Windows.Forms.DataGridView();
            this.tblMain.SuspendLayout();
            this.tblButtons.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gPrepStep)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIngredientList)).BeginInit();
            this.SuspendLayout();
            // 
            // tblMain
            // 
            this.tblMain.ColumnCount = 3;
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.Controls.Add(this.lblRecipeName, 0, 0);
            this.tblMain.Controls.Add(this.lblNumOfCalories, 0, 3);
            this.tblMain.Controls.Add(this.lblNumOfIngredients, 0, 4);
            this.tblMain.Controls.Add(this.lblNumOfSteps, 0, 5);
            this.tblMain.Controls.Add(this.txtRecipeName, 1, 0);
            this.tblMain.Controls.Add(this.txtNumOfCalories, 1, 3);
            this.tblMain.Controls.Add(this.txtNumOfIngredients, 1, 4);
            this.tblMain.Controls.Add(this.txtNumOfSteps, 1, 5);
            this.tblMain.Controls.Add(this.lblCuisineType, 0, 2);
            this.tblMain.Controls.Add(this.lstCuisineType, 1, 2);
            this.tblMain.Controls.Add(this.lblDateCreated, 0, 6);
            this.tblMain.Controls.Add(this.lblDatePublished, 0, 7);
            this.tblMain.Controls.Add(this.label1, 1, 6);
            this.tblMain.Controls.Add(this.label2, 1, 7);
            this.tblMain.Controls.Add(this.label4, 1, 9);
            this.tblMain.Controls.Add(this.lblDateArchived, 0, 8);
            this.tblMain.Controls.Add(this.label3, 1, 8);
            this.tblMain.Controls.Add(this.tblButtons, 2, 9);
            this.tblMain.Controls.Add(this.lblRecipeStatus, 0, 9);
            this.tblMain.Controls.Add(this.lstCreatedByUsers, 1, 1);
            this.tblMain.Controls.Add(this.lblCreatedByUsers, 0, 1);
            this.tblMain.Controls.Add(this.gPrepStep, 2, 5);
            this.tblMain.Controls.Add(this.gIngredientList, 2, 2);
            this.tblMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblMain.Location = new System.Drawing.Point(0, 0);
            this.tblMain.Name = "tblMain";
            this.tblMain.RowCount = 11;
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.Size = new System.Drawing.Size(805, 451);
            this.tblMain.TabIndex = 0;
            // 
            // lblRecipeName
            // 
            this.lblRecipeName.AutoSize = true;
            this.lblRecipeName.Location = new System.Drawing.Point(3, 0);
            this.lblRecipeName.Name = "lblRecipeName";
            this.lblRecipeName.Size = new System.Drawing.Size(98, 20);
            this.lblRecipeName.TabIndex = 0;
            this.lblRecipeName.Text = "Recipe Name";
            // 
            // lblNumOfCalories
            // 
            this.lblNumOfCalories.AutoSize = true;
            this.lblNumOfCalories.Location = new System.Drawing.Point(3, 120);
            this.lblNumOfCalories.Name = "lblNumOfCalories";
            this.lblNumOfCalories.Size = new System.Drawing.Size(118, 20);
            this.lblNumOfCalories.TabIndex = 1;
            this.lblNumOfCalories.Text = "Num Of Calories";
            // 
            // lblNumOfIngredients
            // 
            this.lblNumOfIngredients.AutoSize = true;
            this.lblNumOfIngredients.Location = new System.Drawing.Point(3, 160);
            this.lblNumOfIngredients.Name = "lblNumOfIngredients";
            this.lblNumOfIngredients.Size = new System.Drawing.Size(139, 20);
            this.lblNumOfIngredients.TabIndex = 2;
            this.lblNumOfIngredients.Text = "Num Of Ingredients";
            // 
            // lblNumOfSteps
            // 
            this.lblNumOfSteps.AutoSize = true;
            this.lblNumOfSteps.Location = new System.Drawing.Point(3, 200);
            this.lblNumOfSteps.Name = "lblNumOfSteps";
            this.lblNumOfSteps.Size = new System.Drawing.Size(101, 20);
            this.lblNumOfSteps.TabIndex = 3;
            this.lblNumOfSteps.Text = "Num Of Steps";
            // 
            // txtRecipeName
            // 
            this.txtRecipeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRecipeName.Location = new System.Drawing.Point(148, 3);
            this.txtRecipeName.Name = "txtRecipeName";
            this.txtRecipeName.Size = new System.Drawing.Size(324, 27);
            this.txtRecipeName.TabIndex = 4;
            // 
            // txtNumOfCalories
            // 
            this.txtNumOfCalories.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtNumOfCalories.Location = new System.Drawing.Point(148, 123);
            this.txtNumOfCalories.Name = "txtNumOfCalories";
            this.txtNumOfCalories.Size = new System.Drawing.Size(324, 27);
            this.txtNumOfCalories.TabIndex = 5;
            // 
            // txtNumOfIngredients
            // 
            this.txtNumOfIngredients.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtNumOfIngredients.Location = new System.Drawing.Point(148, 163);
            this.txtNumOfIngredients.Name = "txtNumOfIngredients";
            this.txtNumOfIngredients.ReadOnly = true;
            this.txtNumOfIngredients.Size = new System.Drawing.Size(324, 27);
            this.txtNumOfIngredients.TabIndex = 6;
            // 
            // txtNumOfSteps
            // 
            this.txtNumOfSteps.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtNumOfSteps.Location = new System.Drawing.Point(148, 203);
            this.txtNumOfSteps.Name = "txtNumOfSteps";
            this.txtNumOfSteps.ReadOnly = true;
            this.txtNumOfSteps.Size = new System.Drawing.Size(324, 27);
            this.txtNumOfSteps.TabIndex = 7;
            // 
            // lblCuisineType
            // 
            this.lblCuisineType.AutoSize = true;
            this.lblCuisineType.Location = new System.Drawing.Point(3, 80);
            this.lblCuisineType.Name = "lblCuisineType";
            this.lblCuisineType.Size = new System.Drawing.Size(91, 20);
            this.lblCuisineType.TabIndex = 20;
            this.lblCuisineType.Text = "Cuisine Type";
            // 
            // lstCuisineType
            // 
            this.lstCuisineType.Dock = System.Windows.Forms.DockStyle.Top;
            this.lstCuisineType.FormattingEnabled = true;
            this.lstCuisineType.Location = new System.Drawing.Point(148, 83);
            this.lstCuisineType.Name = "lstCuisineType";
            this.lstCuisineType.Size = new System.Drawing.Size(324, 28);
            this.lstCuisineType.TabIndex = 21;
            // 
            // lblDateCreated
            // 
            this.lblDateCreated.AutoSize = true;
            this.lblDateCreated.Location = new System.Drawing.Point(3, 240);
            this.lblDateCreated.Name = "lblDateCreated";
            this.lblDateCreated.Size = new System.Drawing.Size(97, 20);
            this.lblDateCreated.TabIndex = 22;
            this.lblDateCreated.Text = "Date Created";
            // 
            // lblDatePublished
            // 
            this.lblDatePublished.AutoSize = true;
            this.lblDatePublished.Location = new System.Drawing.Point(3, 280);
            this.lblDatePublished.Name = "lblDatePublished";
            this.lblDatePublished.Size = new System.Drawing.Size(109, 20);
            this.lblDatePublished.TabIndex = 23;
            this.lblDatePublished.Text = "Date Published";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label1.Location = new System.Drawing.Point(148, 240);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(324, 40);
            this.label1.TabIndex = 25;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label2.Location = new System.Drawing.Point(148, 280);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(324, 40);
            this.label2.TabIndex = 26;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label4.Location = new System.Drawing.Point(148, 360);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(324, 40);
            this.label4.TabIndex = 28;
            // 
            // lblDateArchived
            // 
            this.lblDateArchived.AutoSize = true;
            this.lblDateArchived.Location = new System.Drawing.Point(3, 320);
            this.lblDateArchived.Name = "lblDateArchived";
            this.lblDateArchived.Size = new System.Drawing.Size(103, 20);
            this.lblDateArchived.TabIndex = 29;
            this.lblDateArchived.Text = "Date Archived";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label3.Location = new System.Drawing.Point(148, 320);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(324, 40);
            this.label3.TabIndex = 30;
            // 
            // tblButtons
            // 
            this.tblButtons.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.tblButtons.AutoSize = true;
            this.tblButtons.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tblButtons.ColumnCount = 2;
            this.tblMain.SetColumnSpan(this.tblButtons, 2);
            this.tblButtons.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblButtons.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblButtons.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblButtons.Controls.Add(this.btnDelete, 1, 0);
            this.tblButtons.Controls.Add(this.btnSave, 0, 0);
            this.tblButtons.Location = new System.Drawing.Point(334, 403);
            this.tblButtons.Name = "tblButtons";
            this.tblButtons.RowCount = 1;
            this.tblButtons.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblButtons.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblButtons.Size = new System.Drawing.Size(138, 36);
            this.tblButtons.TabIndex = 19;
            // 
            // btnDelete
            // 
            this.btnDelete.AutoSize = true;
            this.btnDelete.Location = new System.Drawing.Point(72, 3);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(63, 30);
            this.btnDelete.TabIndex = 1;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            this.btnSave.AutoSize = true;
            this.btnSave.Location = new System.Drawing.Point(3, 3);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(63, 30);
            this.btnSave.TabIndex = 0;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            // 
            // lblRecipeStatus
            // 
            this.lblRecipeStatus.AutoSize = true;
            this.lblRecipeStatus.Location = new System.Drawing.Point(3, 360);
            this.lblRecipeStatus.Name = "lblRecipeStatus";
            this.lblRecipeStatus.Size = new System.Drawing.Size(98, 20);
            this.lblRecipeStatus.TabIndex = 27;
            this.lblRecipeStatus.Text = "Recipe Status";
            // 
            // lstCreatedByUsers
            // 
            this.lstCreatedByUsers.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstCreatedByUsers.FormattingEnabled = true;
            this.lstCreatedByUsers.Location = new System.Drawing.Point(148, 43);
            this.lstCreatedByUsers.Name = "lstCreatedByUsers";
            this.lstCreatedByUsers.Size = new System.Drawing.Size(324, 28);
            this.lstCreatedByUsers.TabIndex = 31;
            // 
            // lblCreatedByUsers
            // 
            this.lblCreatedByUsers.AutoSize = true;
            this.lblCreatedByUsers.Location = new System.Drawing.Point(3, 40);
            this.lblCreatedByUsers.Name = "lblCreatedByUsers";
            this.lblCreatedByUsers.Size = new System.Drawing.Size(120, 20);
            this.lblCreatedByUsers.TabIndex = 32;
            this.lblCreatedByUsers.Text = "Created By Users";
            // 
            // gPrepStep
            // 
            this.gPrepStep.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gPrepStep.Location = new System.Drawing.Point(478, 203);
            this.gPrepStep.Name = "gPrepStep";
            this.gPrepStep.RowHeadersWidth = 51;
            this.tblMain.SetRowSpan(this.gPrepStep, 3);
            this.gPrepStep.RowTemplate.Height = 29;
            this.gPrepStep.Size = new System.Drawing.Size(324, 114);
            this.gPrepStep.TabIndex = 8;
            // 
            // gIngredientList
            // 
            this.gIngredientList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gIngredientList.Location = new System.Drawing.Point(478, 83);
            this.gIngredientList.Name = "gIngredientList";
            this.gIngredientList.RowHeadersWidth = 51;
            this.tblMain.SetRowSpan(this.gIngredientList, 3);
            this.gIngredientList.RowTemplate.Height = 29;
            this.gIngredientList.Size = new System.Drawing.Size(324, 114);
            this.gIngredientList.TabIndex = 9;
            // 
            // frmRecipeDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(805, 451);
            this.Controls.Add(this.tblMain);
            this.Name = "frmRecipeDetail";
            this.Text = "Recipe Detail";
            this.tblMain.ResumeLayout(false);
            this.tblMain.PerformLayout();
            this.tblButtons.ResumeLayout(false);
            this.tblButtons.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gPrepStep)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIngredientList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tblMain;
        private Label lblRecipeName;
        private Label lblNumOfCalories;
        private Label lblNumOfIngredients;
        private TextBox txtRecipeName;
        private TextBox txtNumOfCalories;
        private TextBox txtNumOfIngredients;
        private TextBox textBox4;
        private Label lblNumOfSteps;
        private TextBox txtNumOfSteps;
        private Label lblCuisineType;
        private ComboBox lstCuisineType;
        private Label lblDateCreated;
        private Label lblDatePublished;
        private Label label1;
        private Label label2;
        private Label lblRecipeStatus;
        private Label label4;
        private Label lblDateArchived;
        private Label label3;
        private ComboBox lstCreatedByUsers;
        private Label lblCreatedByUsers;
        private DataGridView gIngredientList;
        private TableLayoutPanel tblButtons;
        private Button btnDelete;
        private Button btnSave;
        private DataGridView gPrepStep;
    }
}