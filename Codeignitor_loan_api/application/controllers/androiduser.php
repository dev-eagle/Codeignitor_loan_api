<?php



class Androiduser extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		$this->load->library('log_lib');
		$this->load->model('Borrower_model');
	}
		

	function login()
	{
		///receiving main parameters from android post parameters...
			$username = $this->input->get("username");
			$password = $this->input->get("password");
		
		///selection payment	
			$electricity=$this->input->get("electricity");
			$digitalSatellite=$this->input->get("digitalSatellite");
			$internetBundels=$this->input->get("internetBundels");
			
		///displaying method
			$c_loan=$this->input->get("c_loan");
			$applyloan=$this->input->get("applyloan");
			$c_transation=$this->input->get("c_transation");
			$c_repayment=$this->input->get("c_repayment");


		if($this->form_validation->run() == TRUE)
		{
			echo('false');
			$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
			$this->load->view('template/main', array('content' => 'user/login', 'location' => '', 'menu' => array('Register' => 'user/register')));
		}
		else
		{
			$this->load->library('log_lib');
			$login = $this->log_lib->log_user($username, $password);
			$borrower_id=3;

			if ($login) {

				if($c_loan==1){

					$this->load->model('Borrower_model');
					$loan_information=$this->Borrower_model->get_borrower_loan($borrower_id);
					$loandate=$loan_information->result_array()[0]['loan_date'];
					$status=$loan_information->result_array()[0]['status'];
					$totalamount=$loan_information->result_array()[0]['loan_amount_total'];				
					///for android
					echo json_encode(array( 'name'=>$username, 'loandate'=>$loandate , 'status'=>$status, 'totalamount'=>$totalamount,'electricity'=>$electricity, 'digitalSatellitePackage'=>$digitalSatellite,'internetBundels'=>$internetBundels));
				}
				if($applyloan){
					//update database and show 
				}
				
			
			} else {
				echo json_encode("INVALID_USER");
			}
		}

	}
	
	
	function logout()
	{
		$sess_data = array(
			'lend_user'	=> ''
		);
		$this->session->unset_userdata($sess_data);

		redirect('/user/login/', 'refresh');
	}

	function register()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('username','Username','trim|xss_clean|required|callback_username_not_exist');
		$this->form_validation->set_rules('password','Password','trim|xss_clean|required');
		$this->form_validation->set_rules('password_conf','Confirm Password','trim||xss_clean|required|matches[password]');
		if($this->form_validation->run() == FALSE)
		{
			$register_error_flag=1;

		}else
		{
			$username = $this->input->post($username);
			$password = $this->input->post($password);
			if($this->log_lib->register_user($username,$password))
			{
				$this->session->set_flashdata('insertdata', 'The data was inserted');				
			}else
			{
				return FALSE;
			}
		}
	}


	function username_not_exist($username)
	{
		
		$set_another_name_flag=1;

		if($this->log_lib->check_exist_username($username))
		{
			return FALSE;
		}else
		{
			return TRUE;
		}
	}
		

}
