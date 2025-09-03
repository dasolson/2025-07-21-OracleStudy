package com.sist.main;
import javax.swing.*;
import java.awt.Image;

public class ImageChange {
    public static Image getImage(ImageIcon icon, int width, int height) {
    	return icon.getImage().getScaledInstance(width, height, Image.SCALE_SMOOTH);
    	// 축소 / 확대
    }
}
