SELECT
	source as Source,
	COUNT (source) as Tweets
FROM
	public.tweets
GROUP BY
	Source
order by Tweets desc
