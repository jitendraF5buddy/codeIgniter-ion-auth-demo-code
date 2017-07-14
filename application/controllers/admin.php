<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		if (!$this->ion_auth->in_group(1)){
		redirect('auth/login', 'refresh');exit();	
		}
	}
	public function index()
	{
		$userId = $this->ion_auth->get_user_id();
		$data['user_info'] = $this->db->where('id',$userId)->get('users')->row();
		//echo "<pre>";
		//print_r($data['user_info'])	;die;		
		$this->load->view('admin/profile',$data);
	}
	public function change_password($value='')
	{		
		$this->form_validation->set_rules('old', 'Password', 'required');
		$this->form_validation->set_rules('new_confirm', 'Password Confirmation', 'required|matches[new]');
        if ($this->form_validation->run() == FALSE)
        {
            $this->session->set_flashdata('error',validation_errors());            
            redirect('admin/', 'refresh');    
        }else{
			$old_password = $this->input->post('old');
			$new_password = $this->input->post('new');
			$new_password_confirm = $this->input->post('new_confirm');		

			$identity = $this->session->userdata('identity');
			$change = $this->ion_auth->change_password($identity, $old_password, $new_password);
			if ($change){	
		  		$this->session->set_flashdata('success','Password has been changed successfully');
			}else{
				$this->session->set_flashdata('error','Please Enter Valid Password');
			}			
			redirect('admin/', 'refresh');				
		}
	}
	public function update($id)
	{
		$this->form_validation->set_rules('first_name' , 'First Name' ,'required'); 
		$this->form_validation->set_rules('last_name', 'Last Name', 'required');
		//$this->form_validation->set_rules('company', 'Company', 'required'); 
		$this->form_validation->set_rules('username', 'Username', 'required'); 
		//$this->form_validation->set_rules('email', 'Email', 'valid_email|is_unique[users.email]'); 
		
		//$this->form_validation->set_rules('dob', 'Date of Birth', 'required');
		$this->form_validation->set_rules('phone', 'Phone', 'required');
		if($this->form_validation->run()===FALSE)
		{
			redirect('admin/', 'refresh');
		}
		else
		{			
			$this->db->where('id',$id);
			$update = $this->db->update('users',$_POST);
			if ($update)
			{
				$this->update_image($id);
				$this->session->set_flashdata('message', $this->ion_auth->messages());
				redirect('admin/', 'refresh');
			}
			else
			{
				$this->session->set_flashdata('message', $this->ion_auth->errors());
				redirect('admin/', 'refresh');
			}
		}
	}
	public function update_image($user_id)
	{
		if($_FILES['userfile']['tmp_name']!=""){

	 		if($_FILES['userfile']['size'] > 0 && $_FILES['userfile']['error'] == 0 && ($_FILES['userfile']['type'] == "image/jpeg" || $_FILES['userfile']['type'] == "image/png")) 
	 		{  
	            $photo['filename'] = $_FILES['userfile']['name'];
	            $photo['filesize'] = $_FILES['userfile']['size'];
	            $photo['filetype'] = 'image/jpeg';
	            $tmpName  = $_FILES['userfile']['tmp_name'];
	            $fp      = fopen($tmpName, 'r');
	            $content = fread($fp, filesize($tmpName));
	            fclose($fp);
	            if(!get_magic_quotes_gpc()) {
	                $photo['filename'] = addslashes($photo['filename']);
	            }

	            // get originalsize of image
	            $im = imagecreatefromstring($content);
	            $width = imagesx($im);
	            $height = imagesy($im);            
	            // Set thumbnail-height to 180 pixels
	            $imgh = 300;                                          
	            // calculate thumbnail-height from given width to maintain aspect ratio
	            $imgw = $width / $height * $imgh;                                          
	            // create new image using thumbnail-size
	            $thumb=imagecreatetruecolor($imgw,$imgh);                  
	            // copy original image to thumbnail
	            imagecopyresampled($thumb,$im,0,0,0,0,$imgw,$imgh,ImageSX($im),ImageSY($im)); //makes thumb

	            $thumbsdir = ini_get('upload_tmp_dir') ;
	            imagejpeg($thumb, $thumbsdir.$photo['filename'], 80);  //imagejpeg($resampled, $fileName, $quality);            
	            $instr = fopen($thumbsdir.$photo['filename'],"rb");  //need to move this to a safe directory
	            $image = fread($instr,filesize($thumbsdir.$photo['filename']));

	            $photo['filecontent']  = $image;
	            //unlink($thumbsdir.$photo['filename']);
	           	$image = base64_encode($photo['filecontent']); //die();
	            $image_name = addslashes($photo['filename']);
				$additional_data['image']=$image;
				$additional_data['image_name']=$image_name;

				$this->db->where('id',$user_id);
				$res = $this->db->update('users',$additional_data);
				if($res)
				{
					return true;
				}
				else
				{
					return false;
				}
	        } 
	        else
	        {
	        	return false;
	        } 	
		}
	}	
}
