package com.bamboo.common.verificationcode.service;

import java.awt.image.BufferedImage;

public interface VerificationCodeService {
    BufferedImage genCaptcha();
}
