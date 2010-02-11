package express.date
{
	/**
	 * Generates a new date object that represents the system's date 
	 * for yesterday at midnight.
	 * 
	 * @return Yesterday as a date.
	 */
	public function yesterday():Date
	{
		var t:Date = today();
		return new Date(t.setDate(t.date-1));
	}
}