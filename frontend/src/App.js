import './App.css';
import {
  QueryClient,
  QueryClientProvider,
} from '@tanstack/react-query';

import Container from '@mui/material/Container';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import News from './components/news';

const queryClient = new QueryClient();

const App = () => {
  const theme = createTheme({
    palette: {
      mode: 'light',
    },
  });

  return (
    <QueryClientProvider client={queryClient}>
      <ThemeProvider theme={theme}>
        <Container>
          <News />
        </Container>
      </ThemeProvider>
    </QueryClientProvider>
  );
}

export default App;
