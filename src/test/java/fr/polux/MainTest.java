package fr.polux;

import org.testng.annotations.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class MainTest {

    @Test
    public void trueShoudBeTrue() {
        assertThat(true).isTrue();
    }

}
