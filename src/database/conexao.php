<?php
class DB
{
	protected static $instance;

	protected function __construct() {}

	public static function getInstance()
	{
		if(empty(self::$instance))
		{
			$db_info = include('../config.php');
			try
			{
				self::$instance = new PDO(
					"mysql:host=". $db_info['db_host']
					.';port='. $db_info['db_port']
					.';dbname='. $db_info['db_name']
					, $db_info['db_user']
					, $db_info['db_pass']
				);
				self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT);
				self::$instance->query('SET NAMES utf8');
				self::$instance->query('SET CHARACTER SET utf8');

			}
			catch(PDOException $error)
			{
				echo $error->getMessage();
			}
		}
		return self::$instance;
	}
}