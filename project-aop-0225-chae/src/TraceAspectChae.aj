
public aspect TraceAspectChae {

	// pointcut classToTrace()
	pointcut classToTrace(): within(*App); 
	// pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp); 
	
	// pointcut methodtoTrace() 
	pointcut methodToTrace(): classToTrace() && execution(String getName()); 
	// trace method from classToTrace && signature of String getName() 
	
	before(): methodToTrace() {
	      String info = thisJoinPointStaticPart.getSignature() + ", " //
	              + thisJoinPointStaticPart.getSourceLocation().getLine();
	        System.out.println("[BGN] " + info);
	}
	
	after(): methodToTrace() {
	      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
	
}
