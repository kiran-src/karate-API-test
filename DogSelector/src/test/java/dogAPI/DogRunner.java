package dogAPI;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

class DogRunner {
    
    @Karate.Test
    Karate testUsers() {
        Results results = Runner.path("classpath:dogAPI")
                .outputCucumberJson(true)
                .parallel(3);
        generateReport(results.getReportDir());
        return Karate.run("BreedsTests.feature", "VoteCreateDeleteTests.feature", "VoteSearchTests.feature").relativeTo(getClass());
//        return Karate.run("VoteCreateDeleteTests.feature").relativeTo(getClass());
//        return Karate.run("VoteSearchTests.feature").relativeTo(getClass());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "dogAPI");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
