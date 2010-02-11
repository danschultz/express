package express.date
{
	/**
	 * Generates a new date object that represents the system's date 
	 * for tomorrow at midnight.
	 * 
	 * @return Today as a date.
	 */
	public function tomorrow():Date
	{
		var t:Date = today();
		return new Date(t.setDate(t.date + 1));
	}
}