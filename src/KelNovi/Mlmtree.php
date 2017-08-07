<?php

namespace KelNovi;
 

class Mlmtree {

	private static $db = NULL;
	private static $json_output = '';
	private static $owner;
	private static $sequence = array(); 


	public function __construct(){

		
	}


	public function init_connection($host,$db_name,$user,$pass){

		self::$db = new \PDO("mysql:host=".$host.";dbname=".$db_name,$user,$pass);
		

	}

	public function buildTreeStructure($parentID = 1){

		

	    $sql = self::$db->prepare("SELECT * FROM genealogy WHERE gen_parent_user_num_id = :id UNION SELECT *  FROM genealogy WHERE gen_parent_user_num_id IN (SELECT gen_aid FROM genealogy WHERE gen_parent_user_num_id = :id )");

		$sql->execute(array(':id'=>$parentID));
		$records = $sql->fetchAll(\PDO::FETCH_ASSOC);


		$sql2 = self::$db->prepare("SELECT * from genealogy where gen_user_num_id = :pid");
    	$sql2->execute(array(':pid'=>$parentID));
    	self::$owner = $sql2->fetch(\PDO::FETCH_ASSOC);



    	  self::$json_output.= self::$owner['gen_alphauserid']." = { text : { name: \"".self::$owner['gen_alphauserid']."\"  },
                title: \"".self::$owner['gen_alphauserid']."\",
            },";



	    foreach($records as $index){


	           self::$json_output.= $index['gen_alphauserid']." = { parent:".$index['gen_alphaparentid'].",text : { name: \"".$index['gen_alphauserid']."\"  },
	                title: \"".$index['gen_alphauserid']."\",
	            },";  

	            array_push(self::$sequence, $index['gen_alphauserid']);
	        
	        
	    }


	}

	public static function set_raphael_js_src($url){

		return "<script src='".$url."'></script>\n";
	}

	public static function set_treantj_js_src($url){

		return "<script src='".$url."'></script>\n";
	}

	public static function set_treantcss_src($url){

		return "<link rel='stylesheet' href='".$url."'>\n";
	}

	public static function init_tree($div_where_to_append_tree){

			$treejsconfig =  "<script type='text/javascript'>\n";
	        $treejsconfig .="var config = {
	        container: '#".$div_where_to_append_tree."',
	        
	        connectors: {
	            type: 'step'
	        },
	        node: {
	            HTMLclass: 'nodeExample1'
	        }
	    },";
	    $treejsconfig.=self::$json_output;
	    $treejsconfig.="chart_config = [config,".self::$owner['gen_alphauserid'].",".implode(",", self::$sequence)."]";
	    $treejsconfig.="</script>\n";

	    $treejsconfig.="    <script>
	        new Treant( chart_config );
	    </script>";

	    return $treejsconfig;
	}
}