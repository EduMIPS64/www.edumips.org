import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.event.KeyEvent;
import javax.imageio.ImageIO;
import java.io.File;

public class Screenshot {
    public static void main(String[] args) throws Exception {
        Thread.sleep(5000); // wait for UI to draw
        Robot robot = new Robot();
        
        // Press F7 4 times to step mid-execution
        for (int i = 0; i < 4; i++) {
            robot.keyPress(KeyEvent.VK_F7);
            robot.keyRelease(KeyEvent.VK_F7);
            Thread.sleep(500);
        }
        Thread.sleep(1000); // wait for UI update
        
        Rectangle screenRect = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
        BufferedImage screenFullImage = robot.createScreenCapture(screenRect);
        ImageIO.write(screenFullImage, "png", new File(args[0]));
    }
}
