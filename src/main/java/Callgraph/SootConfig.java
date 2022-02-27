package Callgraph;

import soot.G;
import soot.PackManager;
import soot.Scene;
import soot.jimple.infoflow.solver.cfg.InfoflowCFG;
import soot.jimple.spark.SparkTransformer;
import soot.jimple.toolkits.callgraph.CallGraph;
import soot.jimple.toolkits.ide.icfg.JimpleBasedInterproceduralCFG;
import soot.options.Options;

import java.io.File;
import java.util.Collections;

public class SootConfig {

    private final static String USER_HOME = System.getProperty("user.home");
    private static final String androidJar = USER_HOME + "\\Downloads\\Compressed\\android-platforms";


    public static String androidPlatformLocation = androidJar;
    public static String apkFileLocation = "F:\\Ushahidi.apk";
    ;
    static InfoflowCFG info;
    static CallGraph cg;


    public SootConfig() {

    }

    public static CallGraph initSoot() {
        G.reset();
        Options.v().set_allow_phantom_refs(true);
        Options.v().set_prepend_classpath(true);
        Options.v().set_whole_program(true);
        Options.v().set_debug(true);
        Options.v().set_process_dir(Collections.singletonList(apkFileLocation));
//        Options.v().set_no_bodies_for_excluded(true);
        Options.v().set_keep_line_number(true);
        Options.v().set_src_prec(Options.src_prec_apk);
        Options.v().set_process_multiple_dex(true);
//        Options.v().set_force_overwrite(true);

        Options.v().set_verbose(false);


        Options.v().set_android_jars(androidPlatformLocation);

        Scene.v().loadNecessaryClasses();
        Scene.v().loadBasicClasses();
        SparkTransformer.v().transform(); //Call graph
        cg = Scene.v().getCallGraph();
        PackManager.v().runPacks();

        return cg;
    }
}
