package com.myedumyselect.common.util;

public class MissingSessionAttributeException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public MissingSessionAttributeException(String attributeName) {
        super("Missing session attribute: " + attributeName);
    }
}
