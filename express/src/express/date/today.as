package express.date
{
	/**
	 * Generates a new date object that represents the system's date 
	 * for today at midnight
	 * 
	 * @return Today as a date.
	 */
	public function today():Date
	{
		return new Date(now().setHours(0, 0, 0, 0));
	}
}