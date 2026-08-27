DROP DATABASE IF EXISTS ibm_giz_training_db;
CREATE DATABASE ibm_giz_training_db;
USE ibm_giz_training_db;

-- TABLE 1: LITE BATCH
CREATE TABLE lite_batch (
    learner_id VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_id VARCHAR(150) NOT NULL UNIQUE,
    contact_no VARCHAR(15),
    beneficiary_state VARCHAR(50) NOT NULL,
    district VARCHAR(100),
    batch_id VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(20),
    disability VARCHAR(5) DEFAULT 'No',
    alternative_contact VARCHAR(15),
    ews_category VARCHAR(5) DEFAULT 'No',
    ews_document VARCHAR(100),
    occupation VARCHAR(50),
    institution_type VARCHAR(100),
    lite_course_name VARCHAR(150),
    credential_order_id VARCHAR(100) UNIQUE,
    remarks VARCHAR(255),
    region VARCHAR(50),
    marks INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (disability IN ('Yes','No')),
    CHECK (ews_category IN ('Yes','No'))
);

-- TABLE 2: LITE / DEEP BATCH SUBSET
CREATE TABLE lite_deep_batch (
    tracking_id INT PRIMARY KEY AUTO_INCREMENT,
    learner_id VARCHAR(30) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email_id VARCHAR(150),
    course_1_name VARCHAR(150),
    course_1_credential_id VARCHAR(100),
    course_2_name VARCHAR(150),
    course_2_credential_id VARCHAR(100),
    course_3_name VARCHAR(150),
    course_3_credential_id VARCHAR(100),
    project_submission_link VARCHAR(255),
    training_pictures VARCHAR(255),
    attendance_proof VARCHAR(255),
    region VARCHAR(50),
    marks INT,
    remarks VARCHAR(255),
    CONSTRAINT fk_deep_learner
      FOREIGN KEY (learner_id) REFERENCES lite_batch(learner_id)
);

-- ============================================================
-- INSERT 100 LITE BATCH RECORDS
-- ============================================================

INSERT INTO lite_batch (
    learner_id, first_name, last_name, email_id, contact_no,
    beneficiary_state, district, batch_id, date_of_birth, gender,
    disability, alternative_contact, ews_category, ews_document,
    occupation, institution_type, lite_course_name,
    credential_order_id, remarks, region
) VALUES
('IBM-SB-000001', 'Aarav', 'Roy', 'aarav.roy1@example.com', '9334760738', 'Odisha', 'Khordha', 'IBM-GIZ-14-01', '1997-05-03', 'Female', 'No', '8349817734', 'Yes', 'Family Income Certificate', 'Student', 'Government College', 'Project Management Fundamentals', 'VC-308496-001', 'Ready for reporting', 'East'),
('IBM-SB-000002', 'Sahil', 'Gupta', 'sahil.gupta2@example.com', '9203848421', 'Andhra Pradesh', 'NTR', 'IBM-GIZ-11-02', '1998-01-15', 'Male', 'No', '8485451171', 'No', NULL, 'Student', 'Engineering College', 'Web Development Basics', 'VC-377370-002', 'Verified', 'South'),
('IBM-SB-000003', 'Vivek', 'Khan', 'vivek.khan3@example.com', '9208449460', 'Telangana', 'Hyderabad', 'IBM-GIZ-08-05', '1997-11-23', 'Female', 'No', '8508157429', 'No', NULL, 'Student', 'ITI', 'Workplace Skills', 'VC-766563-003', 'Enrollment completed', 'South'),
('IBM-SB-000004', 'Rohan', 'Nair', 'rohan.nair4@example.com', '9787194506', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-06-08', '2001-04-04', 'Male', 'No', '8838908273', 'No', NULL, 'Job Seeker', NULL, 'Project Management Fundamentals', 'VC-330283-004', 'Ready for reporting', 'North'),
('IBM-SB-000005', 'Muskan', 'Das', 'muskan.das5@example.com', '9524806516', 'Maharashtra', 'Mumbai Suburban', 'IBM-GIZ-11-04', '2004-05-08', 'Male', 'No', '8790256940', 'Yes', 'EWS Certificate', 'Student', 'University', 'Digital Marketing Fundamentals', 'VC-246413-005', 'Documents verified', 'West'),
('IBM-SB-000006', 'Vivek', 'Roy', 'vivek.roy6@example.com', '9950488739', 'Andhra Pradesh', 'NTR', 'IBM-GIZ-04-03', '2004-01-15', 'Female', 'No', '8830661141', 'No', NULL, 'Student', 'Management Institute', 'Web Development Basics', 'VC-166613-006', 'Credential issued', 'South'),
('IBM-SB-000007', 'Meera', 'Mishra', 'meera.mishra7@example.com', '9269820594', 'Gujarat', 'Ahmedabad', 'IBM-GIZ-11-02', '2000-04-17', 'Male', 'No', '8587182120', 'No', NULL, 'Student', 'Government College', 'Digital Marketing Fundamentals', 'VC-624902-007', 'Documents verified', 'West'),
('IBM-SB-000008', 'Yash', 'Khan', 'yash.khan8@example.com', '9624636385', 'Kerala', 'Ernakulam', 'IBM-GIZ-17-01', '2003-09-20', 'Male', 'No', '8120912992', 'No', NULL, 'Self-Employed', NULL, 'Data Analytics Basics', 'VC-480612-008', 'Enrollment completed', 'South'),
('IBM-SB-000009', 'Aditi', 'Gupta', 'aditi.gupta9@example.com', '9751325257', 'Delhi', 'New Delhi', 'IBM-GIZ-16-03', '1999-12-22', 'Non-Binary', 'Yes', '8554340903', 'No', NULL, 'Student', 'Polytechnic', 'Project Management Fundamentals', 'VC-891952-009', 'Ready for reporting', 'North'),
('IBM-SB-000010', 'Pooja', 'Jain', 'pooja.jain10@example.com', '9107721109', 'Rajasthan', 'Jaipur', 'IBM-GIZ-19-04', '2003-08-08', 'Female', 'No', '8176228245', 'No', NULL, 'Student', 'Government College', 'Cloud Computing Fundamentals', 'VC-170674-010', 'Verified', 'North'),
('IBM-SB-000011', 'Aditya', 'Chatterjee', 'aditya.chatterjee11@example.com', '9967043303', 'Maharashtra', 'Mumbai Suburban', 'IBM-GIZ-19-08', '1999-09-23', 'Male', 'No', '8537077308', 'Yes', 'Income Certificate', 'Employed', NULL, 'Data Analytics Basics', 'VC-201639-011', 'Ready for reporting', 'West'),
('IBM-SB-000012', 'Rohan', 'Iyer', 'rohan.iyer12@example.com', '9675832441', 'Karnataka', 'Bengaluru Urban', 'IBM-GIZ-04-04', '1999-02-24', 'Female', 'No', '8581695135', 'Yes', 'Income Certificate', 'Employed', NULL, 'Introduction to Generative AI', 'VC-292401-012', 'Enrollment completed', 'South'),
('IBM-SB-000013', 'Kavya', 'Sen', 'kavya.sen13@example.com', '9329509408', 'Telangana', 'Hyderabad', 'IBM-GIZ-06-07', '2002-06-13', 'Male', 'Yes', '8530613729', 'Yes', 'Income Certificate', 'Employed', NULL, 'Cybersecurity Fundamentals', 'VC-497382-013', 'Verified', 'South'),
('IBM-SB-000014', 'Neha', 'Mishra', 'neha.mishra14@example.com', '9161380746', 'Gujarat', 'Ahmedabad', 'IBM-GIZ-19-01', '2005-05-22', 'Male', 'No', '8153839920', 'No', NULL, 'Self-Employed', NULL, 'Web Development Basics', 'VC-599948-014', 'Data verified', 'West'),
('IBM-SB-000015', 'Diya', 'Das', 'diya.das15@example.com', '9142672287', 'Kerala', 'Ernakulam', 'IBM-GIZ-19-04', '2003-06-30', 'Non-Binary', 'No', '8765055833', 'No', NULL, 'Student', 'Private College', 'Introduction to Generative AI', 'VC-789305-015', 'Data verified', 'South'),
('IBM-SB-000016', 'Riya', 'Roy', 'riya.roy16@example.com', '9704509817', 'Kerala', 'Ernakulam', 'IBM-GIZ-03-01', '2002-02-21', 'Non-Binary', 'No', '8207354053', 'No', NULL, 'Student', 'Private College', 'Project Management Fundamentals', 'VC-323508-016', 'Data verified', 'South'),
('IBM-SB-000017', 'Arjun', 'Nair', 'arjun.nair17@example.com', '9421455482', 'Madhya Pradesh', 'Bhopal', 'IBM-GIZ-17-01', '2004-06-28', 'Non-Binary', 'No', '8812308209', 'No', NULL, 'Student', 'Private College', 'Cybersecurity Fundamentals', 'VC-377312-017', 'Verified', 'Central'),
('IBM-SB-000018', 'Karan', 'Kumar', 'karan.kumar18@example.com', '9199104722', 'Odisha', 'Khordha', 'IBM-GIZ-09-08', '1999-10-26', 'Female', 'No', '8781057736', 'No', NULL, 'Job Seeker', NULL, 'Introduction to Generative AI', 'VC-969634-018', 'Enrollment completed', 'East'),
('IBM-SB-000019', 'Aarav', 'Mehta', 'aarav.mehta19@example.com', '9996139578', 'Bihar', 'Patna', 'IBM-GIZ-03-03', '2003-02-13', 'Female', 'No', '8496442646', 'No', NULL, 'Student', 'Open University', 'Cybersecurity Fundamentals', 'VC-550664-019', 'Documents verified', 'East'),
('IBM-SB-000020', 'Rahul', 'Nair', 'rahul.nair20@example.com', '9274484941', 'Bihar', 'Patna', 'IBM-GIZ-14-03', '2007-05-20', 'Female', 'No', '8958872154', 'No', NULL, 'Student', 'University', 'Introduction to Generative AI', 'VC-125990-020', 'Documents verified', 'East'),
('IBM-SB-000021', 'Ankit', 'Iyer', 'ankit.iyer21@example.com', '9981044229', 'Maharashtra', 'Mumbai Suburban', 'IBM-GIZ-07-08', '2000-12-03', 'Male', 'No', '8953995721', 'No', NULL, 'Student', 'Polytechnic', 'Cloud Computing Fundamentals', 'VC-124813-021', 'Ready for reporting', 'West'),
('IBM-SB-000022', 'Sana', 'Mehta', 'sana.mehta22@example.com', '9291735734', 'Rajasthan', 'Jaipur', 'IBM-GIZ-01-02', '2006-11-02', 'Male', 'No', '8723403479', 'Yes', 'EWS Certificate', 'Student', 'Government College', 'Data Analytics Basics', 'VC-725550-022', 'Credential issued', 'North'),
('IBM-SB-000023', 'Karan', 'Mehta', 'karan.mehta23@example.com', '9175133802', 'Maharashtra', 'Pune', 'IBM-GIZ-18-04', '2001-01-31', 'Male', 'No', '8813219781', 'No', NULL, 'Student', 'Engineering College', 'Web Development Basics', 'VC-429164-023', 'Ready for reporting', 'West'),
('IBM-SB-000024', 'Karan', 'Jain', 'karan.jain24@example.com', '9423142470', 'Odisha', 'Khordha', 'IBM-GIZ-13-03', '2003-11-27', 'Non-Binary', 'No', '8536019893', 'No', NULL, 'Job Seeker', NULL, 'Project Management Fundamentals', 'VC-974224-024', 'Verified', 'East'),
('IBM-SB-000025', 'Rahul', 'Singh', 'rahul.singh25@example.com', '9812807629', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-06-02', '2000-03-08', 'Non-Binary', 'No', '8779615069', 'No', NULL, 'Employed', NULL, 'Web Development Basics', 'VC-451470-025', 'Verified', 'Central'),
('IBM-SB-000026', 'Nikhil', 'Jain', 'nikhil.jain26@example.com', '9718121922', 'Delhi', 'New Delhi', 'IBM-GIZ-03-08', '2001-08-25', 'Non-Binary', 'No', '8308773243', 'No', NULL, 'Employed', NULL, 'Introduction to Generative AI', 'VC-618392-026', 'Credential issued', 'North'),
('IBM-SB-000027', 'Arjun', 'Sharma', 'arjun.sharma27@example.com', '9816806128', 'Delhi', 'New Delhi', 'IBM-GIZ-04-08', '1998-07-01', 'Male', 'No', '8670298515', 'No', NULL, 'Employed', NULL, 'Project Management Fundamentals', 'VC-724377-027', 'Enrollment completed', 'North'),
('IBM-SB-000028', 'Meera', 'Chatterjee', 'meera.chatterjee28@example.com', '9394846763', 'Telangana', 'Hyderabad', 'IBM-GIZ-09-08', '2004-01-12', 'Female', 'No', '8572309605', 'Yes', 'Income Certificate', 'Employed', NULL, 'Digital Marketing Fundamentals', 'VC-345884-028', 'Enrollment completed', 'South'),
('IBM-SB-000029', 'Riya', 'Kumar', 'riya.kumar29@example.com', '9546434187', 'Maharashtra', 'Mumbai Suburban', 'IBM-GIZ-14-06', '2003-02-01', 'Male', 'No', '8166857303', 'No', NULL, 'Student', 'Polytechnic', 'Introduction to Generative AI', 'VC-508396-029', 'Data verified', 'West'),
('IBM-SB-000030', 'Ayush', 'Yadav', 'ayush.yadav30@example.com', '9393062061', 'West Bengal', 'Kolkata', 'IBM-GIZ-14-04', '2002-06-23', 'Female', 'No', '8567975319', 'Yes', 'EWS Certificate', 'Self-Employed', NULL, 'AI Fundamentals', 'VC-507746-030', 'Enrollment completed', 'East'),
('IBM-SB-000031', 'Karan', 'Patel', 'karan.patel31@example.com', '9295130056', 'Gujarat', 'Ahmedabad', 'IBM-GIZ-03-07', '1998-07-10', 'Male', 'No', '8153992714', 'No', NULL, 'Job Seeker', NULL, 'Digital Marketing Fundamentals', 'VC-497519-031', 'Enrollment completed', 'West'),
('IBM-SB-000032', 'Simran', 'Mehta', 'simran.mehta32@example.com', '9340756713', 'Rajasthan', 'Jaipur', 'IBM-GIZ-18-01', '2007-09-05', 'Male', 'No', '8798086909', 'No', NULL, 'Student', 'Private College', 'AI Fundamentals', 'VC-890870-032', 'Verified', 'North'),
('IBM-SB-000033', 'Ishaan', 'Sharma', 'ishaan.sharma33@example.com', '9903079055', 'Delhi', 'New Delhi', 'IBM-GIZ-12-03', '2003-10-18', 'Non-Binary', 'No', '8871330207', 'No', NULL, 'Job Seeker', NULL, 'Data Analytics Basics', 'VC-915573-033', 'Documents verified', 'North'),
('IBM-SB-000034', 'Ananya', 'Yadav', 'ananya.yadav34@example.com', '9834717549', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-08-02', '2004-10-26', 'Male', 'No', '8744687060', 'No', NULL, 'Student', 'Private College', 'Web Development Basics', 'VC-920652-034', 'Verified', 'Central'),
('IBM-SB-000035', 'Vivek', 'Iyer', 'vivek.iyer35@example.com', '9859466878', 'Maharashtra', 'Pune', 'IBM-GIZ-14-06', '2004-02-17', 'Male', 'No', '8264272995', 'No', NULL, 'Student', 'Management Institute', 'Cybersecurity Fundamentals', 'VC-869440-035', 'Data verified', 'West'),
('IBM-SB-000036', 'Meera', 'Kumar', 'meera.kumar36@example.com', '9711871397', 'Madhya Pradesh', 'Bhopal', 'IBM-GIZ-09-08', '1999-09-26', 'Male', 'No', '8755338677', 'No', NULL, 'Employed', NULL, 'Introduction to Generative AI', 'VC-452737-036', 'Verified', 'Central'),
('IBM-SB-000037', 'Ayush', 'Mehta', 'ayush.mehta37@example.com', '9191926217', 'Tamil Nadu', 'Chennai', 'IBM-GIZ-09-01', '2002-10-18', 'Female', 'No', '8359154084', 'Yes', 'Family Income Certificate', 'Job Seeker', NULL, 'Introduction to Generative AI', 'VC-612311-037', 'Data verified', 'South'),
('IBM-SB-000038', 'Pooja', 'Saha', 'pooja.saha38@example.com', '9670073085', 'Delhi', 'New Delhi', 'IBM-GIZ-19-06', '2002-04-23', 'Non-Binary', 'No', '8469106688', 'No', NULL, 'Student', 'Management Institute', 'Project Management Fundamentals', 'VC-446859-038', 'Enrollment completed', 'North'),
('IBM-SB-000039', 'Neha', 'Jain', 'neha.jain39@example.com', '9619904272', 'Telangana', 'Hyderabad', 'IBM-GIZ-06-04', '1999-06-06', 'Non-Binary', 'No', '8396889215', 'Yes', 'Family Income Certificate', 'Self-Employed', NULL, 'Web Development Basics', 'VC-897135-039', 'Data verified', 'South'),
('IBM-SB-000040', 'Ananya', 'Singh', 'ananya.singh40@example.com', '9784907325', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-02-05', '2004-10-27', 'Female', 'No', '8908304440', 'No', NULL, 'Student', 'School', 'Data Analytics Basics', 'VC-112861-040', 'Data verified', 'Central'),
('IBM-SB-000041', 'Tanvi', 'Saha', 'tanvi.saha41@example.com', '9775862179', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-13-08', '1997-10-31', 'Non-Binary', 'Yes', '8837071174', 'No', NULL, 'Employed', NULL, 'AI Fundamentals', 'VC-259097-041', 'Documents verified', 'Central'),
('IBM-SB-000042', 'Aditya', 'Gupta', 'aditya.gupta42@example.com', '9766823010', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-10-07', '2000-06-04', 'Non-Binary', 'No', '8164671796', 'No', NULL, 'Employed', NULL, 'Web Development Basics', 'VC-876039-042', 'Verified', 'Central'),
('IBM-SB-000043', 'Priya', 'Singh', 'priya.singh43@example.com', '9348545713', 'Rajasthan', 'Jaipur', 'IBM-GIZ-20-08', '2000-04-07', 'Female', 'No', '8409350265', 'No', NULL, 'Student', 'ITI', 'Workplace Skills', 'VC-174637-043', 'Ready for reporting', 'North'),
('IBM-SB-000044', 'Yash', 'Roy', 'yash.roy44@example.com', '9738923667', 'Delhi', 'New Delhi', 'IBM-GIZ-03-01', '1998-11-11', 'Male', 'No', '8904187231', 'Yes', 'Family Income Certificate', 'Employed', NULL, 'Digital Marketing Fundamentals', 'VC-560485-044', 'Verified', 'North'),
('IBM-SB-000045', 'Pooja', 'Jain', 'pooja.jain45@example.com', '9345805719', 'Telangana', 'Hyderabad', 'IBM-GIZ-11-05', '1997-04-16', 'Female', 'No', '8824022357', 'No', NULL, 'Employed', NULL, 'Web Development Basics', 'VC-715643-045', 'Verified', 'South'),
('IBM-SB-000046', 'Zoya', 'Das', 'zoya.das46@example.com', '9538460431', 'Madhya Pradesh', 'Bhopal', 'IBM-GIZ-16-02', '2002-04-10', 'Male', 'No', '8457887167', 'No', NULL, 'Job Seeker', NULL, 'Python for Data Science', 'VC-802685-046', 'Verified', 'Central'),
('IBM-SB-000047', 'Riya', 'Iyer', 'riya.iyer47@example.com', '9596043327', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-13-01', '2004-05-17', 'Non-Binary', 'No', '8543721204', 'No', NULL, 'Student', 'Government College', 'Cloud Computing Fundamentals', 'VC-643623-047', 'Enrollment completed', 'North'),
('IBM-SB-000048', 'Priya', 'Mishra', 'priya.mishra48@example.com', '9753770973', 'Tamil Nadu', 'Chennai', 'IBM-GIZ-04-01', '2007-12-01', 'Non-Binary', 'No', '8958256589', 'No', NULL, 'Job Seeker', NULL, 'Cloud Computing Fundamentals', 'VC-844261-048', 'Documents verified', 'South'),
('IBM-SB-000049', 'Vivek', 'Sharma', 'vivek.sharma49@example.com', '9393587744', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-16-05', '2002-09-16', 'Non-Binary', 'No', '8546129354', 'No', NULL, 'Employed', NULL, 'Workplace Skills', 'VC-595158-049', 'Documents verified', 'Central'),
('IBM-SB-000050', 'Vivek', 'Verma', 'vivek.verma50@example.com', '9386874458', 'Telangana', 'Hyderabad', 'IBM-GIZ-14-06', '2007-06-24', 'Non-Binary', 'No', '8981058292', 'No', NULL, 'Employed', NULL, 'AI Fundamentals', 'VC-396578-050', 'Ready for reporting', 'South'),
('IBM-SB-000051', 'Muskan', 'Yadav', 'muskan.yadav51@example.com', '9848933239', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-15-06', '2006-10-02', 'Female', 'No', '8356415500', 'No', NULL, 'Student', 'Management Institute', 'Cloud Computing Fundamentals', 'VC-997594-051', 'Credential issued', 'Central'),
('IBM-SB-000052', 'Riya', 'Saha', 'riya.saha52@example.com', '9572775194', 'Bihar', 'Patna', 'IBM-GIZ-19-06', '2006-10-03', 'Female', 'No', '8207064620', 'No', NULL, 'Student', 'Open University', 'Workplace Skills', 'VC-116093-052', 'Ready for reporting', 'East'),
('IBM-SB-000053', 'Sahil', 'Verma', 'sahil.verma53@example.com', '9773020489', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-18-07', '2007-09-14', 'Male', 'No', '8871716956', 'Yes', 'EWS Certificate', 'Employed', NULL, 'Project Management Fundamentals', 'VC-137642-053', 'Data verified', 'North East'),
('IBM-SB-000054', 'Kavya', 'Jain', 'kavya.jain54@example.com', '9415001254', 'Jharkhand', 'Ranchi', 'IBM-GIZ-02-06', '2005-12-06', 'Female', 'No', '8484897084', 'No', NULL, 'Employed', NULL, 'Python for Data Science', 'VC-551607-054', 'Documents verified', 'East'),
('IBM-SB-000055', 'Varun', 'Iyer', 'varun.iyer55@example.com', '9372706093', 'Delhi', 'New Delhi', 'IBM-GIZ-05-04', '2002-03-04', 'Non-Binary', 'No', '8593460064', 'No', NULL, 'Employed', NULL, 'Digital Marketing Fundamentals', 'VC-799233-055', 'Verified', 'North'),
('IBM-SB-000056', 'Shreya', 'Jain', 'shreya.jain56@example.com', '9214518079', 'Telangana', 'Hyderabad', 'IBM-GIZ-10-04', '2001-04-25', 'Male', 'No', '8354697684', 'No', NULL, 'Student', 'Management Institute', 'Web Development Basics', 'VC-476395-056', 'Data verified', 'South'),
('IBM-SB-000057', 'Pooja', 'Jain', 'pooja.jain57@example.com', '9335154329', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-10-04', '2003-10-23', 'Male', 'No', '8783563240', 'Yes', 'Income Certificate', 'Employed', NULL, 'Web Development Basics', 'VC-362801-057', 'Ready for reporting', 'Central'),
('IBM-SB-000058', 'Priya', 'Khan', 'priya.khan58@example.com', '9944511703', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-14-03', '1999-04-03', 'Female', 'No', '8679184667', 'No', NULL, 'Student', 'Engineering College', 'Project Management Fundamentals', 'VC-626169-058', 'Enrollment completed', 'North East'),
('IBM-SB-000059', 'Neha', 'Saha', 'neha.saha59@example.com', '9114945047', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-13-06', '1998-01-05', 'Male', 'No', '8383960237', 'Yes', 'Family Income Certificate', 'Employed', NULL, 'Data Analytics Basics', 'VC-576877-059', 'Enrollment completed', 'North'),
('IBM-SB-000060', 'Zoya', 'Reddy', 'zoya.reddy60@example.com', '9782259766', 'Madhya Pradesh', 'Bhopal', 'IBM-GIZ-20-04', '2004-04-06', 'Female', 'No', '8984607950', 'Yes', 'EWS Certificate', 'Student', 'ITI', 'Introduction to Generative AI', 'VC-222343-060', 'Documents verified', 'Central'),
('IBM-SB-000061', 'Aditi', 'Jain', 'aditi.jain61@example.com', '9880179899', 'Bihar', 'Patna', 'IBM-GIZ-18-07', '2003-08-03', 'Non-Binary', 'No', '8265917699', 'No', NULL, 'Employed', NULL, 'Introduction to Generative AI', 'VC-786735-061', 'Verified', 'East'),
('IBM-SB-000062', 'Meera', 'Iyer', 'meera.iyer62@example.com', '9396225446', 'Tamil Nadu', 'Chennai', 'IBM-GIZ-12-06', '1997-09-06', 'Male', 'No', '8303805386', 'No', NULL, 'Student', 'Private College', 'Workplace Skills', 'VC-196126-062', 'Ready for reporting', 'South'),
('IBM-SB-000063', 'Priya', 'Bose', 'priya.bose63@example.com', '9973008988', 'Rajasthan', 'Jaipur', 'IBM-GIZ-18-04', '2003-07-30', 'Female', 'No', '8350180427', 'No', NULL, 'Employed', NULL, 'Python for Data Science', 'VC-911984-063', 'Documents verified', 'North'),
('IBM-SB-000064', 'Neha', 'Verma', 'neha.verma64@example.com', '9116944811', 'West Bengal', 'Kolkata', 'IBM-GIZ-12-04', '2003-08-09', 'Male', 'No', '8287095435', 'Yes', 'EWS Certificate', 'Student', 'Government College', 'Cybersecurity Fundamentals', 'VC-877747-064', 'Credential issued', 'East'),
('IBM-SB-000065', 'Ananya', 'Sen', 'ananya.sen65@example.com', '9133447745', 'Kerala', 'Ernakulam', 'IBM-GIZ-17-05', '2002-02-20', 'Non-Binary', 'No', '8165310776', 'No', NULL, 'Job Seeker', NULL, 'Workplace Skills', 'VC-988456-065', 'Credential issued', 'South'),
('IBM-SB-000066', 'Nikhil', 'Khan', 'nikhil.khan66@example.com', '9669681065', 'Karnataka', 'Bengaluru Urban', 'IBM-GIZ-19-06', '2001-04-10', 'Non-Binary', 'No', '8416644047', 'No', NULL, 'Student', 'School', 'Project Management Fundamentals', 'VC-734836-066', 'Credential issued', 'South'),
('IBM-SB-000067', 'Ankit', 'Khan', 'ankit.khan67@example.com', '9814154134', 'Odisha', 'Khordha', 'IBM-GIZ-04-06', '2001-10-15', 'Male', 'No', '8373685835', 'No', NULL, 'Student', 'Engineering College', 'Cybersecurity Fundamentals', 'VC-820184-067', 'Credential issued', 'East'),
('IBM-SB-000068', 'Aditya', 'Sen', 'aditya.sen68@example.com', '9541102414', 'Jharkhand', 'Ranchi', 'IBM-GIZ-18-06', '2004-07-07', 'Female', 'No', '8479673044', 'No', NULL, 'Job Seeker', NULL, 'Introduction to Generative AI', 'VC-856086-068', 'Verified', 'East'),
('IBM-SB-000069', 'Meera', 'Jain', 'meera.jain69@example.com', '9716435189', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-12-06', '1998-04-16', 'Male', 'No', '8342836476', 'No', NULL, 'Employed', NULL, 'Introduction to Generative AI', 'VC-986209-069', 'Data verified', 'Central'),
('IBM-SB-000070', 'Aarav', 'Bose', 'aarav.bose70@example.com', '9895609471', 'Andhra Pradesh', 'NTR', 'IBM-GIZ-05-07', '1997-10-13', 'Female', 'No', '8779863265', 'No', NULL, 'Student', 'Government College', 'Data Analytics Basics', 'VC-882354-070', 'Data verified', 'South'),
('IBM-SB-000071', 'Sana', 'Iyer', 'sana.iyer71@example.com', '9910069356', 'Rajasthan', 'Jaipur', 'IBM-GIZ-03-01', '1998-09-30', 'Female', 'No', '8763398699', 'Yes', 'Income Certificate', 'Student', 'Private College', 'Digital Marketing Fundamentals', 'VC-564637-071', 'Ready for reporting', 'North'),
('IBM-SB-000072', 'Tanvi', 'Bose', 'tanvi.bose72@example.com', '9431162800', 'Karnataka', 'Bengaluru Urban', 'IBM-GIZ-19-08', '2002-11-29', 'Non-Binary', 'No', '8148766522', 'No', NULL, 'Student', 'Polytechnic', 'Introduction to Generative AI', 'VC-728437-072', 'Verified', 'South'),
('IBM-SB-000073', 'Ishaan', 'Jain', 'ishaan.jain73@example.com', '9347079497', 'West Bengal', 'Kolkata', 'IBM-GIZ-05-07', '2002-12-22', 'Non-Binary', 'No', '8637152602', 'No', NULL, 'Student', 'Open University', 'Python for Data Science', 'VC-175576-073', 'Credential issued', 'East'),
('IBM-SB-000074', 'Sahil', 'Sharma', 'sahil.sharma74@example.com', '9284547422', 'Bihar', 'Patna', 'IBM-GIZ-04-07', '1997-03-27', 'Male', 'No', '8960413104', 'No', NULL, 'Student', 'School', 'Python for Data Science', 'VC-192410-074', 'Credential issued', 'East'),
('IBM-SB-000075', 'Kavya', 'Iyer', 'kavya.iyer75@example.com', '9308202515', 'Odisha', 'Khordha', 'IBM-GIZ-03-02', '2002-12-14', 'Non-Binary', 'No', '8933468715', 'No', NULL, 'Job Seeker', NULL, 'Python for Data Science', 'VC-468154-075', 'Ready for reporting', 'East'),
('IBM-SB-000076', 'Kavya', 'Khan', 'kavya.khan76@example.com', '9915911873', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-16-08', '2005-06-18', 'Non-Binary', 'No', '8722199123', 'No', NULL, 'Student', 'School', 'Web Development Basics', 'VC-774225-076', 'Ready for reporting', 'North East'),
('IBM-SB-000077', 'Ayush', 'Mehta', 'ayush.mehta77@example.com', '9585238820', 'Maharashtra', 'Mumbai Suburban', 'IBM-GIZ-12-02', '2000-06-25', 'Male', 'No', '8140380477', 'Yes', 'Income Certificate', 'Job Seeker', NULL, 'Python for Data Science', 'VC-972097-077', 'Enrollment completed', 'West'),
('IBM-SB-000078', 'Priya', 'Sen', 'priya.sen78@example.com', '9166436383', 'Jharkhand', 'Ranchi', 'IBM-GIZ-11-08', '2002-08-16', 'Female', 'No', '8583745511', 'Yes', 'Income Certificate', 'Job Seeker', NULL, 'Python for Data Science', 'VC-849014-078', 'Verified', 'East'),
('IBM-SB-000079', 'Priya', 'Patel', 'priya.patel79@example.com', '9828960875', 'Kerala', 'Ernakulam', 'IBM-GIZ-10-07', '2001-08-02', 'Male', 'No', '8741975062', 'No', NULL, 'Student', 'Government College', 'Python for Data Science', 'VC-169113-079', 'Enrollment completed', 'South'),
('IBM-SB-000080', 'Vivek', 'Reddy', 'vivek.reddy80@example.com', '9849987147', 'Odisha', 'Khordha', 'IBM-GIZ-12-05', '2007-11-08', 'Non-Binary', 'No', '8810962214', 'No', NULL, 'Student', 'Management Institute', 'Cybersecurity Fundamentals', 'VC-723945-080', 'Ready for reporting', 'East'),
('IBM-SB-000081', 'Rahul', 'Kumar', 'rahul.kumar81@example.com', '9329987621', 'Jharkhand', 'Ranchi', 'IBM-GIZ-01-06', '2000-06-19', 'Female', 'No', '8466932310', 'No', NULL, 'Student', 'School', 'Cloud Computing Fundamentals', 'VC-337547-081', 'Documents verified', 'East'),
('IBM-SB-000082', 'Aditya', 'Jain', 'aditya.jain82@example.com', '9294181873', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-05-07', '1998-09-24', 'Female', 'No', '8992649957', 'No', NULL, 'Job Seeker', NULL, 'Web Development Basics', 'VC-948343-082', 'Documents verified', 'North East'),
('IBM-SB-000083', 'Aditi', 'Iyer', 'aditi.iyer83@example.com', '9996696177', 'Telangana', 'Hyderabad', 'IBM-GIZ-08-05', '2007-10-31', 'Male', 'No', '8308323285', 'Yes', 'EWS Certificate', 'Student', 'School', 'Workplace Skills', 'VC-906814-083', 'Enrollment completed', 'South'),
('IBM-SB-000084', 'Varun', 'Chatterjee', 'varun.chatterjee84@example.com', '9233871736', 'Gujarat', 'Ahmedabad', 'IBM-GIZ-12-02', '2004-12-23', 'Non-Binary', 'No', '8406084084', 'No', NULL, 'Student', 'Private College', 'Cybersecurity Fundamentals', 'VC-386042-084', 'Credential issued', 'West'),
('IBM-SB-000085', 'Arjun', 'Iyer', 'arjun.iyer85@example.com', '9130266145', 'Kerala', 'Ernakulam', 'IBM-GIZ-13-02', '2001-03-16', 'Female', 'No', '8442185272', 'No', NULL, 'Student', 'Private College', 'Python for Data Science', 'VC-929822-085', 'Documents verified', 'South'),
('IBM-SB-000086', 'Aditi', 'Jain', 'aditi.jain86@example.com', '9355164255', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-05-07', '1998-04-01', 'Male', 'No', '8423358638', 'No', NULL, 'Student', 'Private College', 'AI Fundamentals', 'VC-350021-086', 'Credential issued', 'North East'),
('IBM-SB-000087', 'Aditya', 'Khan', 'aditya.khan87@example.com', '9547286055', 'Telangana', 'Hyderabad', 'IBM-GIZ-01-06', '1999-09-13', 'Non-Binary', 'No', '8301126777', 'No', NULL, 'Student', 'Private College', 'Project Management Fundamentals', 'VC-478120-087', 'Verified', 'South'),
('IBM-SB-000088', 'Vivek', 'Chatterjee', 'vivek.chatterjee88@example.com', '9805560474', 'Kerala', 'Ernakulam', 'IBM-GIZ-03-06', '1999-09-15', 'Non-Binary', 'Yes', '8774585778', 'No', NULL, 'Student', 'Private College', 'Web Development Basics', 'VC-870899-088', 'Enrollment completed', 'South'),
('IBM-SB-000089', 'Aditi', 'Nair', 'aditi.nair89@example.com', '9147036629', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-15-01', '2000-04-16', 'Female', 'No', '8949447049', 'Yes', 'Income Certificate', 'Student', 'Government College', 'Python for Data Science', 'VC-425138-089', 'Data verified', 'North East'),
('IBM-SB-000090', 'Muskan', 'Kumar', 'muskan.kumar90@example.com', '9569172971', 'Gujarat', 'Ahmedabad', 'IBM-GIZ-11-05', '1998-05-25', 'Male', 'No', '8529520110', 'Yes', 'Family Income Certificate', 'Student', 'School', 'Introduction to Generative AI', 'VC-455505-090', 'Documents verified', 'West'),
('IBM-SB-000091', 'Pooja', 'Saha', 'pooja.saha91@example.com', '9185973340', 'Tamil Nadu', 'Chennai', 'IBM-GIZ-06-05', '2000-08-08', 'Female', 'No', '8452101316', 'No', NULL, 'Job Seeker', NULL, 'Digital Marketing Fundamentals', 'VC-421384-091', 'Credential issued', 'South'),
('IBM-SB-000092', 'Diya', 'Mishra', 'diya.mishra92@example.com', '9536164913', 'Karnataka', 'Bengaluru Urban', 'IBM-GIZ-02-02', '2004-07-12', 'Non-Binary', 'No', '8490102359', 'No', NULL, 'Job Seeker', NULL, 'Project Management Fundamentals', 'VC-940010-092', 'Ready for reporting', 'South'),
('IBM-SB-000093', 'Aarav', 'Verma', 'aarav.verma93@example.com', '9829137330', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-19-01', '2003-10-15', 'Female', 'No', '8583100677', 'No', NULL, 'Student', 'Engineering College', 'Python for Data Science', 'VC-565504-093', 'Verified', 'North'),
('IBM-SB-000094', 'Varun', 'Nair', 'varun.nair94@example.com', '9226444910', 'Assam', 'Kamrup Metropolitan', 'IBM-GIZ-17-07', '2007-03-31', 'Non-Binary', 'Yes', '8381080560', 'No', NULL, 'Student', 'ITI', 'Workplace Skills', 'VC-324993-094', 'Data verified', 'North East'),
('IBM-SB-000095', 'Pooja', 'Saha', 'pooja.saha95@example.com', '9861863296', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-03-06', '2004-06-28', 'Male', 'No', '8169727803', 'Yes', 'Family Income Certificate', 'Student', 'Open University', 'Digital Marketing Fundamentals', 'VC-414527-095', 'Documents verified', 'Central'),
('IBM-SB-000096', 'Ankit', 'Nair', 'ankit.nair96@example.com', '9239340792', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-19-06', '2002-03-30', 'Non-Binary', 'No', '8757074545', 'No', NULL, 'Student', 'Private College', 'Data Analytics Basics', 'VC-424314-096', 'Credential issued', 'North'),
('IBM-SB-000097', 'Varun', 'Iyer', 'varun.iyer97@example.com', '9564520346', 'Tamil Nadu', 'Chennai', 'IBM-GIZ-18-03', '2005-08-11', 'Female', 'No', '8639945876', 'No', NULL, 'Student', 'Government College', 'Data Analytics Basics', 'VC-643269-097', 'Documents verified', 'South'),
('IBM-SB-000098', 'Diya', 'Patel', 'diya.patel98@example.com', '9425155441', 'Madhya Pradesh', 'Indore', 'IBM-GIZ-18-05', '1998-05-28', 'Non-Binary', 'No', '8759737342', 'No', NULL, 'Job Seeker', NULL, 'Project Management Fundamentals', 'VC-197966-098', 'Data verified', 'Central'),
('IBM-SB-000099', 'Zoya', 'Yadav', 'zoya.yadav99@example.com', '9927878967', 'Uttar Pradesh', 'Lucknow', 'IBM-GIZ-01-02', '1997-07-06', 'Non-Binary', 'No', '8719303396', 'No', NULL, 'Employed', NULL, 'Digital Marketing Fundamentals', 'VC-782759-099', 'Documents verified', 'North'),
('IBM-SB-000100', 'Meera', 'Sharma', 'meera.sharma100@example.com', '9164331134', 'Karnataka', 'Bengaluru Urban', 'IBM-GIZ-10-08', '1997-10-26', 'Non-Binary', 'No', '8269737590', 'Yes', 'EWS Certificate', 'Job Seeker', NULL, 'Introduction to Generative AI', 'VC-607774-100', 'Credential issued', 'South');

-- ============================================================
-- INSERT 20 LITE / DEEP BATCH RECORDS
-- ============================================================

INSERT INTO lite_deep_batch (
    learner_id, first_name, last_name, email_id,
    course_1_name, course_1_credential_id,
    course_2_name, course_2_credential_id,
    course_3_name, course_3_credential_id,
    project_submission_link, training_pictures,
    attendance_proof, region, remarks
) VALUES
('IBM-SB-000001', 'Aarav', 'Roy', 'aarav.roy1@example.com', 'Project Management Fundamentals', 'IBM-SB-000001-C01', 'AI Fundamentals', 'IBM-SB-000001-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-001', 'Geotagged+Timestamped / Batch-01/Photos', 'Attendance-Proof/LITE-001', 'East', 'Verified'),
('IBM-SB-000002', 'Sahil', 'Gupta', 'sahil.gupta2@example.com', 'Web Development Basics', 'IBM-SB-000002-C01', 'Workplace Skills', 'IBM-SB-000002-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-002', 'Geotagged+Timestamped / Batch-02/Photos', 'Attendance-Proof/LITE-002', 'South', 'Verified'),
('IBM-SB-000003', 'Vivek', 'Khan', 'vivek.khan3@example.com', 'Workplace Skills', 'IBM-SB-000003-C01', 'Data Analytics Basics', 'IBM-SB-000003-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-003', 'Geotagged+Timestamped / Batch-03/Photos', 'Attendance-Proof/LITE-003', 'West', 'Verified'),
('IBM-SB-000004', 'Rohan', 'Nair', 'rohan.nair4@example.com', 'Project Management Fundamentals', 'IBM-SB-000004-C01', 'AI Fundamentals', 'IBM-SB-000004-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-004', 'Geotagged+Timestamped / Batch-04/Photos', 'Attendance-Proof/LITE-004', 'North', 'Verified'),
('IBM-SB-000005', 'Muskan', 'Das', 'muskan.das5@example.com', 'Digital Marketing Fundamentals', 'IBM-SB-000005-C01', 'Workplace Skills', 'IBM-SB-000005-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-005', 'Geotagged+Timestamped / Batch-05/Photos', 'Attendance-Proof/LITE-005', 'East', 'Verified'),
('IBM-SB-000006', 'Vivek', 'Roy', 'vivek.roy6@example.com', 'Web Development Basics', 'IBM-SB-000006-C01', 'Digital Marketing Fundamentals', 'IBM-SB-000006-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-006', 'Geotagged+Timestamped / Batch-06/Photos', 'Attendance-Proof/LITE-006', 'South', 'Verified'),
('IBM-SB-000007', 'Meera', 'Mishra', 'meera.mishra7@example.com', 'Digital Marketing Fundamentals', 'IBM-SB-000007-C01', 'AI Fundamentals', 'IBM-SB-000007-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-007', 'Geotagged+Timestamped / Batch-07/Photos', 'Attendance-Proof/LITE-007', 'West', 'Verified'),
('IBM-SB-000008', 'Yash', 'Khan', 'yash.khan8@example.com', 'Data Analytics Basics', 'IBM-SB-000008-C01', 'Python for Data Science', 'IBM-SB-000008-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-008', 'Geotagged+Timestamped / Batch-08/Photos', 'Attendance-Proof/LITE-008', 'North', 'Verified'),
('IBM-SB-000009', 'Aditi', 'Gupta', 'aditi.gupta9@example.com', 'Project Management Fundamentals', 'IBM-SB-000009-C01', 'AI Fundamentals', 'IBM-SB-000009-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-009', 'Geotagged+Timestamped / Batch-09/Photos', 'Attendance-Proof/LITE-009', 'East', 'Verified'),
('IBM-SB-000010', 'Pooja', 'Jain', 'pooja.jain10@example.com', 'Cloud Computing Fundamentals', 'IBM-SB-000010-C01', 'Workplace Skills', 'IBM-SB-000010-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-010', 'Geotagged+Timestamped / Batch-10/Photos', 'Attendance-Proof/LITE-010', 'South', 'Verified'),
('IBM-SB-000011', 'Aditya', 'Chatterjee', 'aditya.chatterjee11@example.com', 'Data Analytics Basics', 'IBM-SB-000011-C01', 'Introduction to Generative AI', 'IBM-SB-000011-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-011', 'Geotagged+Timestamped / Batch-11/Photos', 'Attendance-Proof/LITE-011', 'West', 'Verified'),
('IBM-SB-000012', 'Rohan', 'Iyer', 'rohan.iyer12@example.com', 'Introduction to Generative AI', 'IBM-SB-000012-C01', 'Data Analytics Basics', 'IBM-SB-000012-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-012', 'Geotagged+Timestamped / Batch-12/Photos', 'Attendance-Proof/LITE-012', 'North', 'Verified'),
('IBM-SB-000013', 'Kavya', 'Sen', 'kavya.sen13@example.com', 'Cybersecurity Fundamentals', 'IBM-SB-000013-C01', 'AI Fundamentals', 'IBM-SB-000013-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-013', 'Geotagged+Timestamped / Batch-13/Photos', 'Attendance-Proof/LITE-013', 'East', 'Verified'),
('IBM-SB-000014', 'Neha', 'Mishra', 'neha.mishra14@example.com', 'Web Development Basics', 'IBM-SB-000014-C01', 'Digital Marketing Fundamentals', 'IBM-SB-000014-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-014', 'Geotagged+Timestamped / Batch-14/Photos', 'Attendance-Proof/LITE-014', 'South', 'Verified'),
('IBM-SB-000015', 'Diya', 'Das', 'diya.das15@example.com', 'Introduction to Generative AI', 'IBM-SB-000015-C01', 'Workplace Skills', 'IBM-SB-000015-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-015', 'Geotagged+Timestamped / Batch-15/Photos', 'Attendance-Proof/LITE-015', 'West', 'Verified'),
('IBM-SB-000016', 'Riya', 'Roy', 'riya.roy16@example.com', 'Project Management Fundamentals', 'IBM-SB-000016-C01', 'Data Analytics Basics', 'IBM-SB-000016-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-016', 'Geotagged+Timestamped / Batch-16/Photos', 'Attendance-Proof/LITE-016', 'North', 'Verified'),
('IBM-SB-000017', 'Arjun', 'Nair', 'arjun.nair17@example.com', 'Cybersecurity Fundamentals', 'IBM-SB-000017-C01', 'AI Fundamentals', 'IBM-SB-000017-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-017', 'Geotagged+Timestamped / Batch-17/Photos', 'Attendance-Proof/LITE-017', 'East', 'Verified'),
('IBM-SB-000018', 'Karan', 'Kumar', 'karan.kumar18@example.com', 'Introduction to Generative AI', 'IBM-SB-000018-C01', 'Workplace Skills', 'IBM-SB-000018-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-018', 'Geotagged+Timestamped / Batch-18/Photos', 'Attendance-Proof/LITE-018', 'South', 'Verified'),
('IBM-SB-000019', 'Aarav', 'Mehta', 'aarav.mehta19@example.com', 'Cybersecurity Fundamentals', 'IBM-SB-000019-C01', 'Python for Data Science', 'IBM-SB-000019-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-019', 'Geotagged+Timestamped / Batch-19/Photos', 'Attendance-Proof/LITE-019', 'West', 'Verified'),
('IBM-SB-000020', 'Rahul', 'Nair', 'rahul.nair20@example.com', 'Introduction to Generative AI', 'IBM-SB-000020-C01', 'Data Analytics Basics', 'IBM-SB-000020-C02', NULL, NULL, 'https://sharepoint.example.org/NF/LITE/Project-020', 'Geotagged+Timestamped / Batch-20/Photos', 'Attendance-Proof/LITE-020', 'North', 'Verified');

-- ============================================================
-- ADD / ASSIGN RANDOM MARKS
-- ============================================================
-- Marks are randomly generated between 50 and 100.
-- Because lite_deep_batch is a subset of lite_batch, the DEEP
-- learner receives the exact same marks as the corresponding
-- LITE learner.

UPDATE lite_batch
SET marks = FLOOR(50 + RAND() * 51);

UPDATE lite_deep_batch d
INNER JOIN lite_batch l
    ON d.learner_id = l.learner_id
SET d.marks = l.marks;

-- Verify that marks match for all common learners.
SELECT
    d.learner_id,
    d.first_name,
    d.marks AS deep_marks,
    l.marks AS lite_marks
FROM lite_deep_batch d
INNER JOIN lite_batch l
    ON d.learner_id = l.learner_id;

-- ============================================================
-- DISPLAY BOTH TABLES
-- ============================================================

SELECT * FROM lite_batch;

SELECT * FROM lite_deep_batch;

-- Optional verification
SELECT COUNT(*) AS total_lite_records FROM lite_batch;
SELECT COUNT(*) AS total_deep_records FROM lite_deep_batch;



-- ################################################################
-- PART 2: SQL INTERVIEW / ANALYTICS QUERIES
-- Based on the attached MySQL Interview Project reference PDF.
-- Adapted to the actual two-table LITE + LITE/DEEP dataset.
-- ################################################################

USE ibm_giz_training_db;

-- ================================================================
-- 1. BASIC SELECT
-- Reference concept: SELECT
-- ================================================================

SELECT *
FROM lite_batch;

SELECT
    learner_id,
    first_name,
    last_name,
    email_id,
    region,
    marks
FROM lite_batch;

-- Aliases
SELECT
    learner_id AS `Learner ID`,
    CONCAT(first_name, ' ', last_name) AS `Learner Name`,
    beneficiary_state AS `State`,
    marks AS `Marks`
FROM lite_batch;

-- ================================================================
-- 2. WHERE
-- ================================================================

-- Learners with marks above 75
SELECT *
FROM lite_batch
WHERE marks > 75;

-- Learners from a particular region
SELECT *
FROM lite_batch
WHERE region = 'East';

-- Multiple conditions
SELECT *
FROM lite_batch
WHERE region = 'East'
  AND marks >= 75;

-- OR
SELECT *
FROM lite_batch
WHERE region = 'East'
   OR region = 'West';


-- ================================================================
-- 3. BETWEEN
-- ================================================================

-- Learners whose marks are between 70 and 85
SELECT
    learner_id,
    first_name,
    last_name,
    marks
FROM lite_batch
WHERE marks BETWEEN 70 AND 85;


-- ================================================================
-- 4. IN
-- ================================================================

SELECT
    learner_id,
    first_name,
    last_name,
    beneficiary_state,
    region
FROM lite_batch
WHERE beneficiary_state IN
      ('West Bengal', 'Bihar', 'Odisha', 'Jharkhand');


-- ================================================================
-- 5. LIKE
-- ================================================================

-- First names beginning with A
SELECT *
FROM lite_batch
WHERE first_name LIKE 'A%';

-- First names ending with a
SELECT *
FROM lite_batch
WHERE first_name LIKE '%a';

-- Names containing "an"
SELECT *
FROM lite_batch
WHERE first_name LIKE '%an%';


-- ================================================================
-- 6. ORDER BY
-- ================================================================

-- Highest marks first
SELECT
    learner_id,
    first_name,
    last_name,
    marks
FROM lite_batch
ORDER BY marks DESC;

-- Sort by region, then marks
SELECT
    learner_id,
    first_name,
    region,
    marks
FROM lite_batch
ORDER BY region ASC, marks DESC;
-- ================================================================
-- 7. LIMIT
-- ================================================================

-- Top 3 learners by marks
SELECT
    learner_id,
    first_name,
    last_name,
    marks
FROM lite_batch
ORDER BY marks DESC
LIMIT 3;


-- ================================================================
-- 8. DISTINCT
-- ================================================================

SELECT DISTINCT region
FROM lite_batch;

-- ================================================================
-- 9. UPDATE
-- Safe demonstration: change a value and immediately restore it.
-- ================================================================

START TRANSACTION;

UPDATE lite_batch
SET remarks = 'Temporary SQL Update Test'
WHERE learner_id = 'IBM-SB-000001';

SELECT learner_id, remarks
FROM lite_batch
WHERE learner_id = 'IBM-SB-000001';

ROLLBACK;

-- ================================================================
-- 10. DELETE
-- Safe demonstration using a non-existent test ID.
-- No real learner is deleted.
-- ================================================================

DELETE FROM lite_batch
WHERE learner_id = 'TEST-DELETE-000';

-- IMPORTANT:
-- DELETE FROM lite_batch;
-- without a WHERE clause would delete all rows.

-- ================================================================
-- 11. INNER JOIN
-- LITE learners who are also present in LITE/DEEP.
-- ================================================================

SELECT
    l.learner_id,
    CONCAT(l.first_name, ' ', l.last_name) AS learner_name,
    l.region,
    l.marks,
    d.course_1_name,
    d.course_2_name
FROM lite_batch l
INNER JOIN lite_deep_batch d
    ON l.learner_id = d.learner_id;


-- ================================================================
-- 12. LEFT JOIN
-- All LITE learners, including those not in LITE/DEEP.
-- ================================================================

SELECT
    l.learner_id,
    CONCAT(l.first_name, ' ', l.last_name) AS learner_name,
    l.region,
    l.marks,
    d.course_1_name,
    d.course_2_name
FROM lite_batch l
LEFT JOIN lite_deep_batch d
    ON l.learner_id = d.learner_id;
	
	

-- ================================================================
-- 14. COUNT
-- ================================================================

SELECT COUNT(*) AS total_lite_learners
FROM lite_batch;

SELECT COUNT(*) AS total_deep_learners
FROM lite_deep_batch;

SELECT COUNT(marks) AS learners_with_marks
FROM lite_batch;

-- ================================================================
-- 15. SUM
-- ================================================================

SELECT
    SUM(marks) AS total_marks
FROM lite_batch;

-- ================================================================
-- 16. AVG
-- ================================================================

SELECT
    AVG(marks) AS average_marks
FROM lite_batch;


-- ================================================================
-- 17. MIN AND MAX
-- ================================================================

SELECT
    MIN(marks) AS minimum_marks,
    MAX(marks) AS maximum_marks
FROM lite_batch;

-- ================================================================
-- 18. GROUP BY
-- ================================================================

-- Average marks by region
SELECT
    region,
    AVG(marks) AS average_marks
FROM lite_batch
GROUP BY region
ORDER BY average_marks DESC;

-- ================================================================
-- 19. HAVING
-- Filter groups after GROUP BY.
-- ================================================================

SELECT
    region,
    COUNT(*) AS learner_count,
    AVG(marks) AS average_marks
FROM lite_batch
GROUP BY region
HAVING COUNT(*) > 20;

-- ================================================================
-- 20. CASE EXPRESSION
-- Performance classification based on marks.
-- Adapted from the reference PDF.
-- ================================================================

SELECT
    learner_id,
    first_name,
    last_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'Excellent'
        WHEN marks >= 75 THEN 'Good'
        WHEN marks >= 60 THEN 'Average'
        WHEN marks IS NULL THEN 'Not Available'
        ELSE 'Needs Improvement'
    END AS performance
FROM lite_batch;

-- ================================================================
-- 21. NULL HANDLING
-- ================================================================

-- Course 3 is intentionally blank for the DEEP subset.
SELECT
    learner_id,
    first_name,
    last_name
FROM lite_deep_batch
WHERE course_3_name IS NULL;
-- Learners without an EWS document
SELECT
    learner_id,
    first_name,
    ews_category,
    ews_document
FROM lite_batch
WHERE ews_document IS NULL;

-- ================================================================
-- 22. SUBQUERY
-- Learners scoring above the overall average.
-- ================================================================

SELECT
    learner_id,
    first_name,
    last_name,
    marks
FROM lite_batch
WHERE marks > (
    SELECT AVG(marks)
    FROM lite_batch
    WHERE marks IS NOT NULL
);

-- ================================================================
-- 23. SECOND-HIGHEST MARKS
-- ================================================================

SELECT
    MAX(marks) AS second_highest_marks
FROM lite_batch
WHERE marks < (
    SELECT MAX(marks)
    FROM lite_batch
);

-- ================================================================
-- 24. TOP 3 MARKS USING DENSE_RANK
-- ================================================================

SELECT *
FROM (
    SELECT
        learner_id,
        first_name,
        last_name,
        marks,
        DENSE_RANK() OVER (
            ORDER BY marks DESC
        ) AS marks_rank
    FROM lite_batch
) ranked
WHERE marks_rank <= 3
ORDER BY marks DESC;

-- ================================================================
-- 25. PARTITION BY
-- Rank learners within each region.
-- ================================================================

SELECT
    learner_id,
    first_name,
    last_name,
    region,
    marks,
    RANK() OVER (
        PARTITION BY region
        ORDER BY marks DESC
    ) AS regional_rank
FROM lite_batch
WHERE marks IS NOT NULL;

