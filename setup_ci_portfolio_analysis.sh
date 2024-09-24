
#!/bin/bash

# Script to set up CodeIgniter project with Bootstrap integration

# Variables
PROJECT_NAME="portfolio_analysis"
CI_VERSION="4.3.6"
CI_ZIP="CodeIgniter-$CI_VERSION.zip"
BOOTSTRAP_CSS="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
BOOTSTRAP_JS="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"
ASSETS_DIR="assets"

# Step 1: Download CodeIgniter
echo "Downloading CodeIgniter..."
wget -q https://github.com/codeigniter4/CodeIgniter4/archive/refs/tags/v$CI_VERSION.zip -O $CI_ZIP

# Step 2: Unzip CodeIgniter
echo "Unzipping CodeIgniter..."
unzip -q $CI_ZIP
rm $CI_ZIP
mv "CodeIgniter4-$CI_VERSION" $PROJECT_NAME

# Step 3: Navigate to the project directory
cd $PROJECT_NAME || exit

# Step 4: Create assets directory for Bootstrap
echo "Creating assets directory..."
mkdir -p $ASSETS_DIR/css $ASSETS_DIR/js

# Step 5: Download Bootstrap CSS and JS
echo "Downloading Bootstrap CSS and JS..."
wget -q $BOOTSTRAP_CSS -O $ASSETS_DIR/css/bootstrap.min.css
wget -q $BOOTSTRAP_JS -O $ASSETS_DIR/js/bootstrap.bundle.min.js

# Step 6: Configure Base URL in .env
echo "Configuring Base URL..."
cp env .env
sed -i 's/# CI_ENVIRONMENT = production/CI_ENVIRONMENT = development/' .env
sed -i 's|# app.baseURL = ''|app.baseURL = 'http://localhost:8080/'|' .env

# Step 7: Create Controller, Model, and View for Portfolio
echo "Creating MVC components for Portfolio..."
CONTROLLER_FILE="app/Controllers/Portfolio.php"
MODEL_FILE="app/Models/PortfolioModel.php"
VIEW_DIR="app/Views/portfolio"
HEADER_VIEW="app/Views/layouts/header.php"
FOOTER_VIEW="app/Views/layouts/footer.php"
INDEX_VIEW="$VIEW_DIR/index.php"

# Creating Portfolio Controller
cat <<EOL > $CONTROLLER_FILE
<?php
namespace App\Controllers;

use App\Models\PortfolioModel;

class Portfolio extends BaseController {
    public function index() {
        \$model = new PortfolioModel();
        \$data['portfolios'] = \$model->getPortfolios();
        return view('layouts/header')
            . view('portfolio/index', \$data)
            . view('layouts/footer');
    }
}
EOL

# Creating Portfolio Model
cat <<EOL > $MODEL_FILE
<?php
namespace App\Models;

use CodeIgniter\Model;

class PortfolioModel extends Model {
    protected \$table = 'portfolios';
    protected \$primaryKey = 'portfolio_id';
    protected \$allowedFields = ['user_id', 'portfolio_name', 'description'];

    public function getPortfolios() {
        return \$this->findAll();
    }
}
EOL

# Creating Views Directory
mkdir -p $VIEW_DIR
mkdir -p "app/Views/layouts"

# Creating Header View
cat <<EOL > $HEADER_VIEW
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio Analysis</title>
    <link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Portfolio Analysis</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="<?php echo base_url('portfolio'); ?>">Portfolios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Login</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container mt-4">
EOL

# Creating Footer View
cat <<EOL > $FOOTER_VIEW
</div>
<footer class="bg-light py-3 text-center">
    <p>&copy; 2024 Portfolio Analysis. All rights reserved.</p>
</footer>
<script src="<?php echo base_url('assets/js/bootstrap.bundle.min.js'); ?>"></script>
</body>
</html>
EOL

# Creating Index View for Portfolio
cat <<EOL > $INDEX_VIEW
<div class="container">
    <h2>Daftar Portofolio</h2>
    <a href="#" class="btn btn-primary">Tambah Portofolio</a>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Nama Portofolio</th>
                <th>Deskripsi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach (\$portfolios as \$portfolio): ?>
                <tr>
                    <td><?php echo \$portfolio['portfolio_name']; ?></td>
                    <td><?php echo \$portfolio['description']; ?></td>
                    <td>
                        <a href="#" class="btn btn-warning">Edit</a>
                        <a href="#" class="btn btn-danger">Hapus</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
EOL

# Step 8: Set Permissions
echo "Setting permissions..."
chmod -R 755 .

# Step 9: Display completion message
echo "CodeIgniter project with Bootstrap has been set up successfully in the '$PROJECT_NAME' directory."
echo "You can now run the server with 'php spark serve' inside the project directory."
