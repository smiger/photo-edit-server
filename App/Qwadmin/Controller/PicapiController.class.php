<?php
/**
*
* 功能说明：文章控制器。
*
**/

namespace Qwadmin\Controller;
use Think\Controller;

class PicapiController extends Controller {
	
	public function _initialize(){
		C(setting());
	}
	public function index(){
		$m = M('photo');
		$p = I('page')?I('page'):0;
		$pagesize = I('size'); 
		$offset = $p*$pagesize; 
		$where['display'] = 0;
		$list = $m->order('id DESC')->limit($offset.','.$pagesize)->select();
		$num = $m->where($where)->count();
		if($num != 0){
			if($list){
				$result = array();
			   foreach($list as $key=>$value){
					 $list[$key]['datetime'] = date("m-d H:i", $value['datetime']);
					 $result[$key]['id'] = intval($list[$key]['id']);
					 $result[$key]['photoId'] = intval($list[$key]['id']);
					 $result[$key]['desc'] = $list[$key]['name'];
					 $result[$key]['preImg'] = C('URL').$list[$key]['image'];
					 $result[$key]['artcleId'] = 0;
					 $result[$key]['isDelete'] = 0;
					 $result[$key]['isLock'] = 1;
					 $result[$key]['type'] = 0;
			   }
			   $data['obj'] = $result;
			   $data['ret'] = 0;
			   echo json_encode($data);
			}else{
				$data['obj'] = [];
				$data['ret'] = 0;
				echo json_encode($data);
			}
		}else{
			$data['obj'] = [];
			$data['ret'] = 0;
			echo json_encode($data);
		}

	}

	public function ninelist(){
		$m = M('photo');
		$p = I('page')?I('page'):0;
		$pagesize = I('size'); 
		$offset = $p*$pagesize; 
		$where['display'] = 0;
		$list = $m->order('id DESC')->limit($offset.','.$pagesize)->select();
		$num = $m->where($where)->count();
		if($num != 0){
			if($list){
				$result = array();
			   foreach($list as $key=>$value){
					 $result[$key]['id'] = intval($list[$key]['id']);
					 $result[$key]['name'] = $list[$key]['category'];
					 $result[$key]['photoDesc'] = $list[$key]['name'];
					 $result[$key]['smallImg'] = C('URL').$list[$key]['image'];
					 $result[$key]['preImg'] = C('URL').$list[$key]['image'];
					 $result[$key]['createTime'] = date("Y-m-d H:i:s", $value['addtime']);
					 $result[$key]['photoItemList'] = null;
			   }
			   $data['obj'] = $result;
			   $data['ret'] = 0;
			   echo json_encode($data);
			}else{
				$data['obj'] = [];
				$data['ret'] = 0;
				echo json_encode($data);
			}
		}else{
			$data['obj'] = [];
			$data['ret'] = 0;
			echo json_encode($data);
		}

	}

	public function nineDetail(){
		$m = M('photo');
		$id = I('id'); 
		$where['id'] = $id;
		$list = $m->where($where)->find();
		$num = $m->where($where)->count();
		if($num != 0){
			if($list){
				$result['id'] = intval($list['id']);
				$result['name'] = $list['category'];
				$result['photoDesc'] = $list['name'];
				$result['smallImg'] = C('URL').$list['image'];
				$result['preImg'] = C('URL').$list['image'];
				$result['createTime'] = date("Y-m-d H:i:s", $list['addtime']);
				preg_match_all('#<img src="(.*?)" alt="" />#',$list['content'],$reg);
				$arr = $reg[1];
				$items = array();
				foreach($arr as $key=>$row){
					$items[$key]['src'] = C('URL').$row;
					$items[$key]['pos'] = $key;
				}
				$result['photoItemList'] = $items;
			   $data['obj'] = $result;
			   $data['ret'] = 0;
			   echo json_encode($data);
			}else{
				$data['ret'] = 0;
				echo json_encode($data);
			}
		}else{
			$data['ret'] = 0;
			echo json_encode($data);
		}

	}
	
	public function config(){
		$data['obj'] = '{"share":true}';
		$data['ret'] = 0;
		echo json_encode($data);
	}

	/*微信图片敏感内容检测*/
    public function imgSecCheck($img)
    {
        $img = file_get_contents($img);
        $filePath = 'Public/attached/tmp/tmp'.time().'.png';
		file_put_contents($filePath, $img);
		
		// $image = new \Think\Image();
		// $image->open($img);
		// $filePath = 'Public/attached/tmp/tmp'.time().'.png';
		// $image->thumb(150,150)->save($filePath);
        $obj = new \CURLFile(realpath($filePath));
        $obj->setMimeType("image/jpeg");
        $file['media'] = $obj;
		$token = $this->getAccessToken();
        $url = "https://api.weixin.qq.com/wxa/img_sec_check?access_token=$token";
		$info = $this->http_request($url,$file);
        return $info;
    }

    /*微信文字敏感内容检测*/
    public function msgSecCheck($msg)
    {
		$msg = I('msg');
        $token = $this->getAccessToken();
        $url = "https://api.weixin.qq.com/wxa/msg_sec_check?access_token=$token";
        $info = $this->http_request($url,json_encode($msg));
        echo json_encode($info);
    }

	public function getAccessToken() {
		// access_token 应该全局存储与更新，以下代码以写入到文件中做示例
		$data = json_decode($this->get_php_file("access_token.php"));
		if ($data->expire_time < time()) {
		  // 如果是企业号用以下URL获取access_token
		  // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";
		  $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".C('appID')."&secret=".C('appSecret');
		  $res = json_decode($this->httpGet($url));
		  $access_token = $res->access_token;
		  if ($access_token) {
			$data->expire_time = time() + 7000;
			$data->access_token = $access_token;
			$this->set_php_file("access_token.php", json_encode($data));
		  }
		} else {
		  $access_token = $data->access_token;
		}
		return $access_token;
	  }
	
	  // 微信相关
	  private function httpGet($url,$method='get',$data=''){
		  $ch = curl_init();
		  curl_setopt($ch, CURLOPT_URL, $url);
		  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, strtoupper($method));
		  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		  curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		  curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		  curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		  $temp = curl_exec($ch);
		  return $temp;
	  }
	
	  private function get_php_file($filename) {
		return trim(substr(file_get_contents($filename), 15));
	  }
	  private function set_php_file($filename, $content) {
		$fp = fopen($filename, "w");
		fwrite($fp, "<?php exit();?>" . $content);
		fclose($fp);
	  }

	  //HTTP请求（支持HTTP/HTTPS，支持GET/POST）
	  private function http_request($url, $data = null)
	  {
		  $curl = curl_init();
		  curl_setopt($curl, CURLOPT_URL, $url);
		  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
  
		  if (!empty($data)) {
			  curl_setopt($curl, CURLOPT_POST, TRUE);
			  curl_setopt($curl, CURLOPT_POSTFIELDS,$data);
		  }
		  curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
		  $output = curl_exec($curl);
		  curl_close($curl);
		  
		  return $output;
	  }


	public function upload($file){
		$upload = new \Think\Upload();// 实例化上传类
		$upload->maxSize   =     3145728 ;// 设置附件上传大小
		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		$upload->rootPath  =     './Public/attached/upload/'; // 设置附件上传根目录
		$upload->savePath  =     ''; // 设置附件上传（子）目录
		// 上传文件
		$info   =   $upload->uploadOne($file);
		if(!$info) {// 上传错误提示错误信息
			$json = '{"errcode":-1,"errmsg":"'.$upload->getError().'"}';
			return json_decode($json,true);
		}else{// 上传成功
			$img = "./Public/attached/upload/".$info['savepath'].$info['savename'];
			return json_decode($this->imgSecCheck($img),true);
		}
	}

	public function add(){
		$res = $_FILES['file'];
		$res = $this->upload($res);
		echo json_encode($res);
	}

	
	public function view(){
		$m = M('photo');
		$map['id'] = I('id');
		$id = I('id');
		$list = $m->where($map)->select();
		$qid = I('qid');
		$olist = $m->order('id DESC')->limit(0,1)->find(); 
		$wlist = $m->order('id ASC')->limit(0,1)->find(); 
		$where['vid'] = I('id');
		$countX = $m->where($map)->count();
		$numList = $m->count();
		if($countX != 0 && $list){
			$gzlists = M('photo_guanzhu')->where($where)->order('time DESC')->limit(88)->select();
			if($list){
			   foreach($list as $key=>$value){
					 $list[$key]['content'] = $value['content']; 
			   }
			}
			$lists = array_merge_recursive($list[0],array("gzlist"=>$gzlists,"wlist"=>$wlist[id],"olist"=>$olist[id]));
			echo json_encode($lists);
		}else{
			if($numList != 0){
				$lists = array_merge_recursive($wlist,$olist);
				echo json_encode($lists[id]);
			}
		}
		
		
	}

	public function getGuanzhu(){
		# code...
		$cid = I('cid');
		$where['vid'] = I('vid');
		$openid = I('openid');
		$avatar = I('avatar');
		if($cid == 1){
			if($openid != null){
				$where['openid'] = I('openid');
				$num = M('photo_guanzhu')->where($where)->count();
				if($num > 0){
					$data['time'] = time();
					$gList = M('photo_guanzhu')->where($where)->save($data);
					if($gList){
						echo "ok-save";
					}else{
						echo "no-save";
					}
				}else{
					$data['vid'] = I('vid');
					$data['openid'] = I('openid');
					if($avatar != null && $avatar != 'undefined' ){
						$data['avatar'] = I('avatar');
					}else {
						$data['avatar'] = "https://api.55625.com/Public/Home/images/nouser.jpg";
					}
					$uname = I('uname');
					if($uname == 'undefined' && $uname != null){
						$data['uname'] = I('uname');
					}else{
						$data['uname'] = "游客";
					}
					$data['time'] = time();
					$gList = M('photo_guanzhu')->data($data)->add();
					if($gList){
						echo "ok-add";
					}else{
						echo "no-add";
					}
				}
			}else{
				echo "no openid";
			}
		}elseif ($cid = 2) {
			$gzList = M('photo_guanzhu')->where($where)->order('time DESC')->limit(88)->select();
			if($gzList){
				echo json_encode($gzList);
			}else{
				echo "no-data";
			}

		}




	}

	public function GetOpenid(){
		if (!isset($_GET['code'])){
			$baseUrl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			$url = $this->__CreateOauthUrlForCode($baseUrl);
			Header("Location: $url");
			exit();
		} else {
		    $code = $_GET['code'];
			$openid = $this->getOpenidFromMp($code);
			echo $openid;
		}
	}
	private function __CreateOauthUrlForCode($redirectUrl){
		$urlObj["appid"] = C('appID');
		$urlObj["redirect_uri"] = "$redirectUrl";
		$urlObj["response_type"] = "code";
		$urlObj["scope"] = "snsapi_base";
		$urlObj["state"] = "STATE"."#wechat_redirect";
		$bizString = $this->ToUrlParams($urlObj);
		return "https://open.weixin.qq.com/connect/oauth2/authorize?".$bizString;
	}
	private function ToUrlParams($urlObj){
		$buff = "";
		foreach ($urlObj as $k => $v){
			if($k != "sign"){
				$buff .= $k . "=" . $v . "&";
			}
		}
		$buff = trim($buff, "&");
		return $buff;
	}
	public function GetOpenidFromMp($code){
		$url = $this->__CreateOauthUrlForOpenid($code);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_TIMEOUT, $this->curl_timeout);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		$res = curl_exec($ch);
		curl_close($ch);
		$data = json_decode($res,true);
		$this->data = $data;
		$openid = $data['openid'];
		return $openid;
	}
	private function __CreateOauthUrlForOpenid($code){
		$urlObj["appid"] = C('appID');
		$urlObj["secret"] = C('appSecret');
		$urlObj["code"] = $code;
		$urlObj["grant_type"] = "authorization_code";
		$bizString = $this->ToUrlParams($urlObj);
		return "https://api.weixin.qq.com/sns/oauth2/access_token?".$bizString;
	}

	public function checkUpdate(){
		$version= I('version'); 
		if($version == "1.0.1"){
			$data['update'] = "No";
		}else{
			$data['update'] = "Yes";
		}
		$data['new_version'] = "1.0.1";
		$data['apk_file_url'] = "https://w7.cocogo.xyz/Public/app-release.apk";
		$data['update_log'] = "1、新增去观看获取金币\r\n2、优化领取逻辑";
		$data['target_size'] = "3.5M";
		$data['new_md5'] = "";
		$data['constraint'] = false; 
		echo json_encode($data);
	}
	public function checkUpdatePingou(){
		$version= I('version'); 
		$new_version = "2.0";
		if($version == $new_version){
			$data['update'] = "No";
		}else{
			$data['update'] = "Yes";
		}
		$data['new_version'] = "V".$new_version;
		$data['apk_file_url'] = "https://w7.cocogo.xyz/Public/app-pingou.apk";
		$data['update_log'] = "1、优化逻辑";
		$data['target_size'] = "3.5M";
		$data['new_md5'] = "";
		$data['constraint'] = false; 
		echo json_encode($data);
	}

}
