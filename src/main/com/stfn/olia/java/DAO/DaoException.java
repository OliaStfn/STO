package DAO;

public class DaoException extends Exception {
    public DaoException() {

    }

    public DaoException(String message) {
        super(message);
    }

    public DaoException(String message, Throwable cause) {
        super(message, cause);
    }

    public DaoException(Throwable cause) {
        super(cause);
    }

    protected DaoException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super("Dao Exception - " + message, cause, enableSuppression, writableStackTrace);
    }
}
