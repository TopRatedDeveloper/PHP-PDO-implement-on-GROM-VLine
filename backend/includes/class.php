<?php require_once "db.php";
class demo extends db {
	public function insert($cutname,$summary,$review,$satisfication){
		$query = "SET sql_mode=’NO_AUTO_VALUE_ON_ZERO’;";
		$stmt = $this->connect()->prepare($query);

		$sel_custquery = "select cust_id from customer where cust_nm='$cutname'";
		$stmt = $this->connect()->prepare($sel_custquery);
		$stmt->execute([$sel_custquery]);
		$temp1 = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$cust_id = $temp1[0]['cust_id'];

		$sel_prchid = "select prch_id from purchase where cust_id='$cust_id'";
		$stmt = $this->connect()->prepare($sel_prchid);
		$stmt->execute([$sel_prchid]);
		$temp2 = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$prch_id = $temp2[0]['prch_id'];

		$ratingquery = "INSERT INTO rating(cust_id, prch_id, rtng_val1_ind, msg_txt, post_dt, show_ind) VALUE('$cust_id', '$prch_id', '$satisfication', '$review', NOW(), 'Y')";
		$stmt = $this->connect()->prepare($ratingquery);

		if($stmt->execute([$ratingquery])){
			echo "success!";
		}
	}
	
	public function load(){
		$query = "SELECT
					r.*,
					c.cust_nm,
					prch.*,
					r.cust_id,
					c.cust_id,
					r.prch_id,
					prch.prch_id 
				  FROM
					rating AS r
					JOIN customer AS c ON r.cust_id = c.cust_id
					JOIN purchase AS prch ON r.prch_id = prch.prch_id";

		$stmt = $this->connect()->prepare($query);
		$stmt->execute();
			while($row = $stmt->fetchAll(PDO::FETCH_ASSOC)){
				return json_encode($row) ;
			}
	}
	
//end of class
}