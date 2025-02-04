<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "vocal_vantage";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch appointments from database
$sql = "SELECT * FROM appoinments";
$result = $conn->query($sql);

$appointments = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $appointments[] = [
            'app_id' => $row['App_id'],
            'date' => $row['Date'],
            'patient_name' => $row['Patient_name'],
            'age' => $row['Age'],
            'therapist' => $row['Therapist'],
            'time' => $row['Time'],
        ];
    }
}

// Insert appointment logic if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Patient_name = $_POST['patient_name'];
    $Age = $_POST['age'];
    $Therapist = $_POST['therapist'];
    $Date = $_POST['date'];
    $Time = $_POST['time'];

    // Get the current timestamp for Get_at
    $Get_at = date('Y-m-d H:i:s');

    $sql = "INSERT INTO appoinments (Patient_name, Age, Therapist, Date, Time, Get_at) 
            VALUES ('$Patient_name', '$Age', '$Therapist', '$Date', '$Time', '$Get_at')";

    if ($conn->query($sql) === TRUE) {
        echo "Appointment scheduled successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Calendar</title>
    <style>
        .calendar {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            width: 14.28%;
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        .has-appointment {
            background-color: #ffeb3b; /* Yellow background */
            font-weight: bold;
        }

        .has-appointment:hover {
            background-color: #fbc02d; /* Darker yellow on hover */
        }

        .today {
            background-color: #4caf50; /* Green background for today */
            color: white;
        }

        .selected {
            background-color: #2196f3; /* Blue background when selected */
            color: white;
        }

        .selected:hover {
            background-color: #1976d2; /* Darker blue on hover */
        }

        #appointmentDetails {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        /* Modal Popup Styles */
        #appointmentPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            z-index: 999;
            width: 300px;
        }

        #appointmentPopup h3 {
            margin-top: 0;
        }

        #appointmentPopup button {
            margin-top: 20px;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }

        #appointmentPopup button:hover {
            background-color: #45a049;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 998;
        }
    </style>
</head>
<body>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "vocal_vantage";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch appointments from database
$sql = "SELECT * FROM appoinments";
$result = $conn->query($sql);

$appointments = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $appointments[] = [
            'app_id' => $row['App_id'],
            'date' => $row['Date'],
            'patient_name' => $row['Patient_name'],
            'age' => $row['Age'],
            'therapist' => $row['Therapist'],
            'time' => $row['Time'],
        ];
    }
}

// Insert appointment logic if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Patient_name = $_POST['patient_name'];
    $Age = $_POST['age'];
    $Therapist = $_POST['therapist'];
    $Date = $_POST['date'];
    $Time = $_POST['time'];

    // Get the current timestamp for Get_at
    $Get_at = date('Y-m-d H:i:s');

    $sql = "INSERT INTO appoinments (Patient_name, Age, Therapist, Date, Time, Get_at) 
            VALUES ('$Patient_name', '$Age', '$Therapist', '$Date', '$Time', '$Get_at')";

    if ($conn->query($sql) === TRUE) {
        echo "Appointment scheduled successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

    <div class="calendar">
        <div class="header-calender">
            <button id="prev">❮</button>
            <h2 id="monthYear"></h2>
            <button id="next">❯</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody id="calendarBody">
                <!-- Dates will be dynamically inserted here -->
            </tbody>
        </table>
    </div>

    <!-- Overlay for Popup -->
    <div id="overlay"></div>

    <!-- Modal Popup for Appointment Details -->
    <div id="appointmentPopup">
        <h3>Appointment Details</h3>
        <p><strong>Patient:</strong> <span id="popupPatientName"></span></p>
        <p><strong>Age:</strong> <span id="popupAge"></span></p>
        <p><strong>Therapist:</strong> <span id="popupTherapist"></span></p>
        <p><strong>Date:</strong> <span id="popupDate"></span></p>
        <p><strong>Time:</strong> <span id="popupTime"></span></p>
        <button id="closePopup">Close</button>
    </div>

    <script>
    const calendarBody = document.getElementById('calendarBody');
    const monthYear = document.getElementById('monthYear');
    const prev = document.getElementById('prev');
    const next = document.getElementById('next');
    const overlay = document.getElementById('overlay');
    const appointmentPopup = document.getElementById('appointmentPopup');
    const closePopup = document.getElementById('closePopup');

    // PHP data passed to JS
    const appointments = <?php echo json_encode($appointments); ?>;

    let date = new Date();
    let currentMonth = date.getMonth();
    let currentYear = date.getFullYear();
    let selectedDateCell = null;

    const months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    function showCalendar(month, year) {
        calendarBody.innerHTML = "";
        monthYear.textContent = `${months[month]} ${year}`;

        const firstDay = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        let date = 1;
        for (let i = 0; i < 6; i++) {
            let row = document.createElement("tr");

            for (let j = 0; j < 7; j++) {
                let cell = document.createElement("td");

                if (i === 0 && j < firstDay) {
                    row.appendChild(cell);
                } else if (date > daysInMonth) {
                    break;
                } else {
                    cell.textContent = date;

                    // Highlight the dates with appointments
                    const dateString = `${year}-${month + 1}-${date}`;
                    const appointment = appointments.find(app => app.date === dateString);

                    if (appointment) {
                        cell.classList.add("has-appointment");
                        cell.title = `Appointment: ${appointment.patient_name} with ${appointment.therapist} at ${appointment.time}`;
                    }

                    // Highlight today's date
                    const today = new Date();
                    if (today.getFullYear() === year && today.getMonth() === month && today.getDate() === date) {
                        cell.classList.add("today");
                    }

                    // Add click event for date selection
                    cell.addEventListener("click", function () {
                        // Display appointment details in popup
                        if (appointment) {
                            document.getElementById('popupPatientName').textContent = appointment.patient_name;
                            document.getElementById('popupAge').textContent = appointment.age;
                            document.getElementById('popupTherapist').textContent = appointment.therapist;
                            document.getElementById('popupDate').textContent = appointment.date;
                            document.getElementById('popupTime').textContent = appointment.time;
                            appointmentPopup.style.display = "block";
                            overlay.style.display = "block";
                        }
                    });

                    row.appendChild(cell);
                    date++;
                }
            }

            calendarBody.appendChild(row);
        }
    }

    prev.addEventListener('click', () => {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        showCalendar(currentMonth, currentYear);
    });

    next.addEventListener('click', () => {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        showCalendar(currentMonth, currentYear);
    });

    // Close the popup
    closePopup.addEventListener('click', () => {
        appointmentPopup.style.display = "none";
        overlay.style.display = "none";
    });

    // Show the current month calendar
    showCalendar(currentMonth, currentYear);
    </script>

</body>
</html>
