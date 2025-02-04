<?php
$host = 'localhost'; 
$username = 'root';
$password = '';
$dbname = 'vocal_vantage';

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $report_id = $_POST['report_id'];
    $role = $_POST['role'];
    $name = $_POST['name'];
    $subject = $_POST['subject'];
    $description = $_POST['description'];
    $special_note = $_POST['special_note'];

    // Insert data into the database
    $sql = "INSERT INTO platform_reports_special (report_id, role, name, subject, description, special_note) 
            VALUES ('$report_id', '$role', '$name', '$subject', '$description', '$special_note')";

if ($conn->query($sql) === TRUE) {
    echo "<script>
            alert('Report sent successful');
            window.location.href = 'platformreport_paitent_specialneeds.php';
          </script>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Platform Report Form - Paitent </title>
    <style>
       /* General Reset */
       * {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: linear-gradient( #E9EDF4,#b3cce6, #E9EDF4);
    min-height: 80vh;
        }
        /* Keyframes for animations */
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        @keyframes slideIn {
            from {
                transform: translateX(-20px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        @keyframes buttonHover {
            from {
                transform: scale(1);
            }
            to {
                transform: scale(1.1);
            }
        }
        
        header {
            position: relative;
            height: 50px;
        }
        /* Navbar */
        
        .navbar {
            display: flex;
            align-items: center;
            padding: 1.0rem 3rem;
            background-color: #E9EDF4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .navbar .logo {
            font-size: 1.3rem;
            font-weight: bold;
            color: #204060;
            background-color: #FFFFFF;
            padding: 0.5rem 0.8rem;
            border-radius: 35px;
            animation: slideIn 4s ease forwards;
        }
        img{
            width: 100px;
            height: 100px;
        }
        
        .navbar .auth-buttons {
            margin-left: 1000px;
            background-color: #FFFFFF;
            padding: 0.01rem 0.5rem;
            border-radius: 35px;
            
        }
        
        .auth-buttons .signup {
            padding: 0.6rem 1.0rem;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s, color 0.3s;
        }
        
        .auth-buttons .signup {
            background-color: transparent;
            color: #204060;
        }
        
        .auth-buttons .signup:hover {
            font-weight: bold;
            font-size: 1rem;
            color: #204060;
            animation: buttonHover 0.3s forwards;
        }



/*form*/
        .container {
            background: #ffffff;
    padding: 20px 30px;
    border-radius: 50px 0 50px 0;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
    width: 100%;
    max-width: 450px;
    margin-left: 500px;
    margin-top: 10px;
    margin-bottom: 50px;
    animation: slideIn 0.8s ease-out;
        }
        
        h1 {
            font-size: 2rem;
   text-align: center;
    color: #204060;
    margin-bottom: 20px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
    margin-bottom: 5px;
    font-size: 1rem;
    font-weight: 600;
    color: #000E00;
        }
        
        input,select,
        textarea {
            width: 96%;
    padding: 5px;
    border-radius: 8px;
    border: 1px solid #b3cce6;
    font-size: 1em;
    outline: none;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
textarea {
    resize: none;
        }
        
input:focus,select:focus,
textarea:focus {
    border-color: #b3cce6;
    box-shadow: 0 0 8px  rgba(39, 138, 48, 0.5);
    outline: none;
        }
        
.btn-submit {
    display: block;
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #b3cce6, #E9EDF4);
    color: #204060;
    border: none;
    border-radius: 30px 0 30px 0;
    font-size: 1.1em;
    font-weight: 700;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
        
.btn-submit:hover {
    transform: translateY(-2px);
    font-size: 1.3em;
    background: linear-gradient(135deg, #19334d, #E9EDF4);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    color: white;
        }
    </style>
</head>

<body>


            <!-- Navbar -->
            <header class="navbar">
                <img src="../Resourses/index/logo 01.png">
                <div class="logo">Vocal Vantage</div>
        
                <div class="auth-buttons">
                    <a href="platformreport_home.html"><button class="signup" >Back to Home</button></a>
                </div>
            </header>
        <br>

    <div class="container">
        <h1>Patient Report Form</h1>
        <form id="patient-report-form" action="" method="POST">
            <div class="form-group">
                <label for="report_id">Report ID:</label>
                <input type="text" id="report_id" name="report_id" placeholder="Enter Report ID" required>
            </div>
            <div class="form-group">
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="patient_specealneeds">Patient - Specealneeds</option>
                    </select>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter Name" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" placeholder="Enter Subject" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" placeholder="Enter Description" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="special_note">Special Note:</label>
                <textarea id="special_note" name="special_note" placeholder="Enter Special Note" rows="3"></textarea>
            </div>
            <button type="submit" class="btn-submit">Submit Report</button>
        </form>
    </div>
</body>

</html>
