SELECT
	artist,
	COUNT (artist) as albumcount
FROM
	public.vinyls
GROUP BY
	artist
order by albumcount desc