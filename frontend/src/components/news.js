import { useQuery } from '@tanstack/react-query';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';

const fetchNews = async (page) => {
  const partialUrl = [
    process.env.REACT_APP_API_URL,
    '/api/v1/news'
  ].join('');

  const url = [
    partialUrl,
    `p=${page}`
  ].join('?');

  try {
    const response = await fetch(url);
    return response.json();
  } catch (e) {
    console.log(`Error fetching data from ${url}`);
    console.log({
      e,
    });
    throw e;
  }
};

const News = () => {
  const {
    isLoading,
    isError,
    data,
    error
  } = useQuery({
    queryKey: ['page'],
    queryFn: fetchNews
  });

  if (isLoading) {
    return <span>Loading...</span>;
  }

  if (isError) {
    return <span>Error: {error.message}</span>;
  }

  console.log(data);
  return (
    <List dense>
      {Object.keys(data).map((title) => {
        let host;

        const link = data[title];

        try {
          host = (
            new URL(link)
          ).host;
        } catch (e) {
          host = link
        }

        return (
          <ListItem
            button
            component="a"
            href={link}
            key={link}
            target="_blank"
          >
            <ListItemText
              primary={title}
              secondary={host}
            />
          </ListItem>
        )
      })}
    </List>
  );
}

export default News;
