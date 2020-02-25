<?php require_once "db.php";
	// public function insert($f,$l,$w,$c,$e){
	// 	$query = "INSERT INTO users(first,last,work,city,email) VALUES(?,?,?,?,?) ";
	// 	$stmt = $this->connect()->prepare($query);
	// 	if($stmt->execute([$f,$l,$w,$c,$e])){
	// 		echo "Registered Successfully!";
	// 	}
	// }
		$query = "SELECT
					r.*,
					c.cust_nm,
					p.*,
					prch.*,
					r.cust_id,
					c.cust_id,
					r.prch_id,
					prch.prch_id,
					r.prd_id,
					p.prd_id 
				FROM
					rating AS r
					JOIN customer AS c ON r.cust_id = c.cust_id
					JOIN product AS p ON r.prd_id = p.prd_id
					JOIN purchase AS prch ON r.prch_id = prch.prch_id";

		$stmt = $this->connect()->prepare($query);
		$stmt->execute();
			while($row = $stmt->fetchAll(PDO::FETCH_ASSOC)){
				echo $row; exit;
				return json_encode($row) ;
			}
?>