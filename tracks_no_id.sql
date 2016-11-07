select t.Name as 'Track Name', a.Title as 'Album Title' , mt.Name as 'Media Type', g.Name as 'Genre'
from Track t, Album a, MediaType mt, Genre g
where t.MediaTypeId = mt.MediaTypeId and t.GenreId = g.GenreId and t.AlbumId = a.AlbumId
group by t.Name