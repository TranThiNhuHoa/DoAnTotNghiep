<?php 
	include "Properties.php";

	$dbhost = Properties::DATABASE['host'];
	$dbuser = Properties::DATABASE['username'];
	$dbpass = Properties::DATABASE['password'];
	$db = Properties::DATABASE['name'];

	$connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db) or die("Không thể kết nối đến cơ sở dữ liệu!");
	mysqli_set_charset($connect, "utf8");

	$query = "SELECT * FROM to_chuc_dao_tao";
	$query_result = mysqli_query($GLOBALS['connect'], $query);
	$count = mysqli_num_rows($query_result);

	class Pagination {
    	protected $_config = 	array(
        							'current_page'  => 1,
        							'total_record'  => 1,
        							'total_page'    => 1,
        							'limit'         => 10,
        							'start'         => 0,
        							'link_full'     => '',
        							'link_first'    => '',
    							);
    	
    	function init($config = array()) {
	        foreach ($config as $key => $val){
            	if (isset($this->_config[$key])){
                	$this->_config[$key] = $val;
            	}
        	}
         
	        if ($this->_config['limit'] < 0){
            	$this->_config['limit'] = 0;
        	}
         
        	$this->_config['total_page'] = ceil($this->_config['total_record'] / $this->_config['limit']);
         
        	if (!$this->_config['total_page']){
        	    $this->_config['total_page'] = 1;
        	}
         
        	if ($this->_config['current_page'] < 1){
        	    $this->_config['current_page'] = 1;
        	}
         
        	if ($this->_config['current_page'] > $this->_config['total_page']){
        	    $this->_config['current_page'] = $this->_config['total_page'];
        	}
        	 
        	$this->_config['start'] = ($this->_config['current_page'] - 1) * $this->_config['limit'];
    	}	
    
    	private function __link($page) {
        	if ($page <= 1 && $this->_config['link_first']){
            	return $this->_config['link_first'];
        	}
        
        	return str_replace('{page}', $page, $this->_config['link_full']);
    	}
     
    	function html() {   
        	$p = '';
        	
        	if ($this->_config['total_record'] > $this->_config['limit']) {
        		$a = ($this->_config['current_page'] - 1) * $this->_config['limit'];
        		$b = $this->_config['limit'];

        		$query = "SELECT * FROM to_chuc_dao_tao LIMIT $a, $b";
				$query_result = mysqli_query($GLOBALS['connect'], $query);

				while ($row = mysqli_fetch_assoc($query_result)) {
					echo "<table class=" . "table_infor_pass" . ">";
						echo "<tr>";
							echo "<td class=" . "td_infor_pass" . ">";
								echo "<a href='".$row["Website"]."' target='_blank'><img src='".$row["Logo"]."' alt='school logo' width='100px'></a>";
							echo "</td>";
							echo "<td>";
								echo "<ul>";
									echo "<li class=" . "infor_pass" . "><b>Tên trường:</b> " . $row["Ten_To_Chuc_Dao_Tao"] ."</li>";
									echo "<li class=" . "infor_pass" . "><b>Mã trường:</b> " . $row["Ma_To_Chuc_Dao_Tao"] . "</li>";
									echo "<li class=" . "infor_pass" . "><b>Trang chủ:</b> <a href='" . $row["Website"] . "' target='_blank'>" . $row["Website"] . "</a></li>";
									echo "<li class=" . "infor_pass" . "><b>Thông tin tuyển sinh:</b> <a href='" . $row["Thong_Tin_Tuyen_Sinh"] . "' target='_blank'>" . $row["Thong_Tin_Tuyen_Sinh"] . "</a></li>";
								echo "</ul>";
							echo "</td>";
						echo "</tr>";
					echo "</table>";
					echo "<br><br>";
				}

            	$p = '<ul>';	 
	            
	            if ($this->_config['current_page'] > 1) {
    	            $p .= '<li class="infor"><a href="'.$this->__link('1').'">First</a></li>';
        	        $p .= '<li class="infor"><a href="'.$this->__link($this->_config['current_page']-1).'">Prev</a></li>';
            	}
             
            	for ($i = 1; $i <= $this->_config['total_page']; $i++) {
	                if ($this->_config['current_page'] == $i){
    	                $p .= '<li class="infor"><span>'.$i.'</span></li>';
        	        }
            	    else{
                	    $p .= '<li class="infor"><a href="'.$this->__link($i).'">'.$i.'</a></li>';
                	}
            	}
 
	            if ($this->_config['current_page'] < $this->_config['total_page']) {
	                $p .= '<li class="infor"><a href="'.$this->__link($this->_config['current_page'] + 1).'">Next</a></li>';
    	            $p .= '<li class="infor"><a href="'.$this->__link($this->_config['total_page']).'">Last</a></li>';
        	    }
             
            	$p .= '</ul>';
        	}

        	return $p;
    	}
	}

	$config = 	array(
    				'current_page'  => isset($_GET['page']) ? $_GET['page'] : 1, 
    				'total_record'  => $count, 
    				'limit'         => 5,
    				'link_full'     => 'infor.php?page={page}',
    				'link_first'    => 'infor.php',
				);
 
	$paging = new Pagination();
 
	$paging->init($config);
 
	echo $paging->html();
	echo "<br><br>";

?>
 
<style>

	.infor {
		float:left; 
		margin: 3px; 
		border: solid 1px #52D017;
		display: inline;
	}

	.infor_pass {
		list-style-type: none;
	}

	.table_infor_pass {
		border: 1px solid #52D017;
		width: 100%;
		border-radius: 5px;
		height: 200px;
	}

	.td_infor_pass {
		width: 20%;
	}

    a {
    	padding: 5px;
    	color: black;
    }

    span {
    	display:inline-block; 
    	padding: 0px 3px; 
    	background: #52D017; 
    	color:white 
    }
</style>