
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class MyServiceTest {
    @Test
    public void testVerifyInteraction() {
        ExternalApi mockApi = mock(ExternalApi.class);
        MyService service = new MyService(mockApi);

        service.fetchData();  // method under test

        verify(mockApi).getData(); // verify interaction
    }
}
