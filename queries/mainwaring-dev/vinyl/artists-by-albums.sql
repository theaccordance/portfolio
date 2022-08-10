SELECT
	artist as Artist,
	COUNT (artist) as Albums
FROM
	public.vinyls
GROUP BY
	Artist
order by Albums desc
