<?php
/**
*
* 功能说明：文章控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class PhotoController extends ComController {

	public function add(){
		$this -> display();
	}

	public function index($p=1){

		$p = intval($p)>0?$p:1;

		$article = M('photo');
		$pagesize = 20;
		$offset = $pagesize*($p-1);
		$prefix = C('DB_PREFIX');
		$where = '';
		$count = $article->where($where)->count();
		$list  = $article->where($where)->order("id desc")->limit($offset.','.$pagesize)->select();
		$page	=	new \Think\Page($count,$pagesize);
		$page = $page->show();
        $this->assign('list',$list);
        $this->assign('page',$page);
		$this -> display();
	}

	public function del(){

		$where['id'] = I('aids');
		if(M('photo')->where($where)->delete()){
			$this->success('恭喜，删除成功！');
		}else{
			$this->error('参数错误！');
		}


	}

	public function edit($aid){

		$aid = intval($aid);
		$article = M('photo')->where('id='.$aid)->find();
		$this->assign('article',$article);
		$this -> display();
	}

	public function update($aid=0){

		$aid = intval($aid);
		$data['name'] = isset($_POST['title'])?$_POST['title']:false;

		$data['category'] = isset($_POST['category'])?$_POST['category']:0;
		$data['content'] = isset($_POST['content'])?$_POST['content']:false;
		$data['image'] = I('post.thumbnail','','strip_tags');
		$data['addtime'] = time();		
		if($aid){
			M('photo')->data($data)->where('id='.$aid)->save();
			$this->success('恭喜！编辑成功！');
		}else{
			$aid = M('photo')->data($data)->add();
			if($aid){
				$this->success('恭喜！新增成功！');
			}else{
				$this->error('抱歉，未知错误！');
			}

		}
	}

	public function upload($action){
        $upload = new \Think\Upload();
        $upload->maxSize = 2097172;
        $upload->exts = array('jpg','gif','png','jpeg');
        $upload->savePath = '/Uploads/Photo/';
        $info = $upload->upload();
        foreach($info as $file){
            $name = $file['savepath'].$file['savename'];
             }
        $this->assign('action',$action);
        $this->assign('name',$name);
        if(!$info){
           $this->error($upload->getError());
        }else{
            $image = new \Think\Image();
            $image->open("./Uploads{$name}");
            $image->thumb(800, 800)->save("./Uploads{$name}");
            $this->display('image');
        }
    }
}
