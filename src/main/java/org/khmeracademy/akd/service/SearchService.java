package org.khmeracademy.akd.service;

import javax.validation.constraints.AssertFalse;
import java.util.List;

/**
 * Created by Teckchun on 3/9/17.
 */
public interface SearchService {
    public List searchByKeyword(String keyword);
}
