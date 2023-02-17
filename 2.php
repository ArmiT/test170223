<?php

$statement = $mysqli->prepare("
    SELECT
        q.*,
        u.name,
        u.gender
    FROM questions q
    INNER JOIN users u ON u.id=q.user_id
    WHERE catalog_id=?;
");

// assumption that $catId expected is integer
$statement->bind_param('i', $catId);
$statement->execute();
$rows = $statement->get_result();

while ($row = $rows->fetch_assoc()) {
    $user = [
        'name' => $row['name'],
        'gender' => $row['gender'],
    ];

    unset($row['name'], $row['gender']);

    $result[] = [
        'question' => $row,
        'user' => $user,
    ];
}

$rows->free();
