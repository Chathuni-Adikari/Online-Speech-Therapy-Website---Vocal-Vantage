<?php
$host = 'localhost'; 
$dbname = 'vocal_vantage'; 
$username = 'root'; 
$password = ''; 

try {
    // Create a PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if the form is submitted
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Retrieve and sanitize input values
        $patient_id = htmlspecialchars($_POST['patient_id']);
        $amount = htmlspecialchars($_POST['amount']);
        $status = htmlspecialchars($_POST['status']);
        $therapist_id = htmlspecialchars($_POST['therapist_id']);
        $guardian_id = htmlspecialchars($_POST['guardian_id']);
        $date = htmlspecialchars($_POST['date']);
        $time = htmlspecialchars($_POST['time']);

        // Prepare an SQL statement to insert the data
        $sql = "INSERT INTO payments (patient_id, amount, status, therapist_id, guardian_id, date, time) 
                VALUES (:patient_id, :amount, :status, :therapist_id, :guardian_id, :date, :time)";
        $stmt = $pdo->prepare($sql);

        // Bind the parameters
        $stmt->bindParam(':patient_id', $patient_id);
        $stmt->bindParam(':amount', $amount);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':therapist_id', $therapist_id);
        $stmt->bindParam(':guardian_id', $guardian_id);
        $stmt->bindParam(':date', $date);
        $stmt->bindParam(':time', $time);

        // Execute the statement
        if ($stmt->execute()) {
            // Generate receipt content
            $receipt = "----- Payment Receipt -----\n";
            $receipt .= "Patient ID: $patient_id\n";
            $receipt .= "Amount: $amount\n";
            $receipt .= "Status: $status\n";
            $receipt .= "Therapist ID: $therapist_id\n";
            $receipt .= "Guardian ID: $guardian_id\n";
            $receipt .= "Date: $date\n";
            $receipt .= "Time: $time\n";
            $receipt .= "---------------------------\n";

            // Set headers to force download
            header('Content-Type: text/plain');
            header('Content-Disposition: attachment; filename="receipt.txt"');
            header('Content-Length: ' . strlen($receipt));

            // Output the receipt content
            echo $receipt;
        } else {
            echo "Error saving payment details.";
        }
    }
} catch (PDOException $e) {
    // Handle connection or query errors
    echo "Database error: " . $e->getMessage();
}
?>

