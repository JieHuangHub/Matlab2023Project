classdef  Opti < casadi.PrintableCommon & casadi.SharedObject
    %OPTI [INTERNAL] 
    %
    %
    %A simplified interface for NLP modeling/solving.
    %
    %This class offers a view with model description facilities The API is 
    %
    %guaranteed to be stable.
    %
    %Example NLP:
    %
    %::
    %
    %    opti = casadi.Opti();
    %  
    %    x = opti.variable();
    %    y = opti.variable();
    %  
    %    opti.minimize(  (y-x^2)^2   );
    %    opti.subject_to( x^2+y^2==1 );
    %    opti.subject_to(     x+y>=1 );
    %  
    %    opti.solver('ipopt');
    %    sol = opti.solve();
    %  
    %    sol.value(x)
    %    sol.value(y)
    %
    %
    %
    %Example parametric NLP:
    %
    %::
    %
    %    opti = casadi.Opti();
    %  
    %    x = opti.variable(2,1);
    %    p = opti.parameter();
    %  
    %    opti.minimize(  (p*x(2)-x(1)^2)^2   );
    %    opti.subject_to( 1<=sum(x)<=2 );
    %  
    %    opti.solver('ipopt');
    %  
    %    opti.set_value(p, 3);
    %    sol = opti.solve();
    %    sol.value(x)
    %  
    %    opti.set_value(p, 5);
    %    sol = opti.solve();
    %    sol.value(x)
    %
    %
    %
    %Joris Gillis, Erik Lambrechts, Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_16
    %
    %C++ includes: optistack.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = internal_variable(self,varargin)
    %INTERNAL_VARIABLE [INTERNAL] 
    %
    %  MX = INTERNAL_VARIABLE(self, int n, int m, char attribute)
    %  MX = INTERNAL_VARIABLE(self, Sparsity sp, char attribute)
    %  MX = INTERNAL_VARIABLE(self, MX symbol, char attribute)
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_VARIABLE(self, int n, int m, char attribute)
    %
    %
    %
    %[INTERNAL] 
    %Create a decision variable (symbol)
    %
    %The order of creation matters. The order will be reflected in the 
    %
    %optimization problem. It is not required for decision variables to 
    %actualy 
    %appear in the optimization problem.
    %
    %Parameters:
    %-----------
    %
    %n: 
    %number of rows (default 1)
    %
    %m: 
    %number of columnss (default 1)
    %
    %attribute: 
    %'full' (default) or 'symmetric'
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_18
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L112
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L51-L57
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_VARIABLE(self, Sparsity sp, char attribute)
    %  INTERNAL_VARIABLE(self, MX symbol, char attribute)
    %
    %
    %
    %[INTERNAL] 
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1291, self, varargin{:});
    end
    function varargout = internal_parameter(self,varargin)
    %INTERNAL_PARAMETER [INTERNAL] 
    %
    %  MX = INTERNAL_PARAMETER(self, int n, int m, char attribute)
    %  MX = INTERNAL_PARAMETER(self, Sparsity sp, char attribute)
    %  MX = INTERNAL_PARAMETER(self, MX symbol, char attribute)
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_PARAMETER(self, Sparsity sp, char attribute)
    %  INTERNAL_PARAMETER(self, MX symbol, char attribute)
    %
    %
    %
    %[INTERNAL] 
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_PARAMETER(self, int n, int m, char attribute)
    %
    %
    %
    %[INTERNAL] 
    %Create a parameter (symbol); fixed during optimization.
    %
    %The order of creation does not matter. It is not required for 
    %parameter to 
    %actualy appear in the optimization problem. Parameters 
    %that do appear, must
    % be given a value before the problem can be 
    %solved.
    %
    %Parameters:
    %-----------
    %
    %n: 
    %number of rows (default 1)
    %
    %m: 
    %number of columnss (default 1)
    %
    %attribute: 
    %'full' (default) or 'symmetric'
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_19
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L127
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L90-L96
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1292, self, varargin{:});
    end
    function varargout = minimize(self,varargin)
    %MINIMIZE [INTERNAL] 
    %
    %  MINIMIZE(self, MX f, double linear_scale)
    %
    %Set objective.
    %
    %Objective must be a scalar. Default objective: 0 When method is called
    % 
    %multiple times, the last call takes effect
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1a
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L137
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L114-L120
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1293, self, varargin{:});
    end
    function varargout = internal_subject_to(self,varargin)
    %INTERNAL_SUBJECT_TO [INTERNAL] 
    %
    %  INTERNAL_SUBJECT_TO(self)
    %  INTERNAL_SUBJECT_TO(self, MX g, struct options)
    %  INTERNAL_SUBJECT_TO(self, {MX} g, struct options)
    %  INTERNAL_SUBJECT_TO(self, MX g, DM linear_scale, struct options)
    %  INTERNAL_SUBJECT_TO(self, {MX} g, DM linear_scale, struct options)
    %
    %Clear constraints.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L172
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L146-L152
    %
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_SUBJECT_TO(self, MX g, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Add constraints.
    %
    %Examples:
    %
    %::
    %
    %  * \\begin{itemize}
    %  * opti.subject_to( sqrt(x+y) >= 1);
    %  * opti.subject_to( sqrt(x+y) > 1)}: same as above
    %  * opti.subject_to( 1<= sqrt(x+y) )}: same as above
    %  * opti.subject_to( 5*x+y==1 )}: equality
    %  *
    %  * Python
    %  * opti.subject_to([x*y>=1,x==3])
    %  * opti.subject_to(opti.bounded(0,x,1))
    %  *
    %  * MATLAB
    %  * opti.subject_to({x*y>=1,x==3})
    %  * opti.subject_to( 0<=x<=1 )
    %  * 
    %
    %
    %
    %Related functionalities:
    %opti.lbg,opti.g,opti.ubg represent the vector of 
    %flattened constraints
    %
    %opti.debug.show_infeasibilities() may be used to inspect which 
    %constraints 
    %are violated
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L165
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L122-L128
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_SUBJECT_TO(self, {MX} g, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Add constraints.
    %
    %Examples:
    %
    %::
    %
    %  * \\begin{itemize}
    %  * opti.subject_to( sqrt(x+y) >= 1);
    %  * opti.subject_to( sqrt(x+y) > 1)}: same as above
    %  * opti.subject_to( 1<= sqrt(x+y) )}: same as above
    %  * opti.subject_to( 5*x+y==1 )}: equality
    %  *
    %  * Python
    %  * opti.subject_to([x*y>=1,x==3])
    %  * opti.subject_to(opti.bounded(0,x,1))
    %  *
    %  * MATLAB
    %  * opti.subject_to({x*y>=1,x==3})
    %  * opti.subject_to( 0<=x<=1 )
    %  * 
    %
    %
    %
    %Related functionalities:
    %opti.lbg,opti.g,opti.ubg represent the vector of 
    %flattened constraints
    %
    %opti.debug.show_infeasibilities() may be used to inspect which 
    %constraints 
    %are violated
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L166
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L130-L132
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_SUBJECT_TO(self, MX g, DM linear_scale, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Add constraints.
    %
    %Examples:
    %
    %::
    %
    %  * \\begin{itemize}
    %  * opti.subject_to( sqrt(x+y) >= 1);
    %  * opti.subject_to( sqrt(x+y) > 1)}: same as above
    %  * opti.subject_to( 1<= sqrt(x+y) )}: same as above
    %  * opti.subject_to( 5*x+y==1 )}: equality
    %  *
    %  * Python
    %  * opti.subject_to([x*y>=1,x==3])
    %  * opti.subject_to(opti.bounded(0,x,1))
    %  *
    %  * MATLAB
    %  * opti.subject_to({x*y>=1,x==3})
    %  * opti.subject_to( 0<=x<=1 )
    %  * 
    %
    %
    %
    %Related functionalities:
    %opti.lbg,opti.g,opti.ubg represent the vector of 
    %flattened constraints
    %
    %opti.debug.show_infeasibilities() may be used to inspect which 
    %constraints 
    %are violated
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L167
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L134-L140
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_SUBJECT_TO(self, {MX} g, DM linear_scale, struct options)
    %
    %
    %
    %[INTERNAL] 
    %Add constraints.
    %
    %Examples:
    %
    %::
    %
    %  * \\begin{itemize}
    %  * opti.subject_to( sqrt(x+y) >= 1);
    %  * opti.subject_to( sqrt(x+y) > 1)}: same as above
    %  * opti.subject_to( 1<= sqrt(x+y) )}: same as above
    %  * opti.subject_to( 5*x+y==1 )}: equality
    %  *
    %  * Python
    %  * opti.subject_to([x*y>=1,x==3])
    %  * opti.subject_to(opti.bounded(0,x,1))
    %  *
    %  * MATLAB
    %  * opti.subject_to({x*y>=1,x==3})
    %  * opti.subject_to( 0<=x<=1 )
    %  * 
    %
    %
    %
    %Related functionalities:
    %opti.lbg,opti.g,opti.ubg represent the vector of 
    %flattened constraints
    %
    %opti.debug.show_infeasibilities() may be used to inspect which 
    %constraints 
    %are violated
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L168
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L142-L144
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INTERNAL_SUBJECT_TO(self)
    %
    %
    %
    %[INTERNAL] 
    %Clear constraints.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L172
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L146-L152
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1294, self, varargin{:});
    end
    function varargout = solver(self,varargin)
    %SOLVER [INTERNAL] 
    %
    %  SOLVER(self, char solver, struct plugin_options, struct solver_options)
    %
    %Set a solver.
    %
    %Parameters:
    %-----------
    %
    %solver: 
    %any of the nlpsol plugins can be used here In practice, not all 
    %nlpsol
    % plugins may be supported yet
    %
    %options: 
    %passed on to nlpsol plugin No stability can be guaranteed about 
    %this 
    %part of the API
    %
    %options: 
    %to be passed to nlpsol solver No stability can be guaranteed about
    % 
    %this part of the API
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L184
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L155-L163
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1295, self, varargin{:});
    end
    function varargout = set_initial(self,varargin)
    %SET_INITIAL [INTERNAL] 
    %
    %  SET_INITIAL(self, {MX} assignments)
    %  SET_INITIAL(self, MX x, DM v)
    %
    %Set initial guess for decision variables
    %
    %::
    %
    %  * opti.set_initial(x, 2)
    %  * opti.set_initial(10*x(1), 2)
    %  * 
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L196
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L172-L178
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET_INITIAL(self, {MX} assignments)
    %
    %
    %
    %[INTERNAL] 
    %Set initial guess for decision variables
    %
    %::
    %
    %  * opti.set_initial(x, 2)
    %  * opti.set_initial(10*x(1), 2)
    %  * 
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L196
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L172-L178
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET_INITIAL(self, MX x, DM v)
    %
    %
    %
    %[INTERNAL] 
    %Set initial guess for decision variables
    %
    %::
    %
    %  * opti.set_initial(x, 2)
    %  * opti.set_initial(10*x(1), 2)
    %  * 
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L195
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L165-L171
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1296, self, varargin{:});
    end
    function varargout = set_value(self,varargin)
    %SET_VALUE [INTERNAL] 
    %
    %  SET_VALUE(self, {MX} assignments)
    %  SET_VALUE(self, MX x, DM v)
    %
    %Set value of parameter.
    %
    %Each parameter must be given a value before 'solve' can be called
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L206
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L205-L211
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET_VALUE(self, {MX} assignments)
    %
    %
    %
    %[INTERNAL] 
    %Set value of parameter.
    %
    %Each parameter must be given a value before 'solve' can be called
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L206
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L205-L211
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET_VALUE(self, MX x, DM v)
    %
    %
    %
    %[INTERNAL] 
    %Set value of parameter.
    %
    %Each parameter must be given a value before 'solve' can be called
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L205
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L181-L187
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1297, self, varargin{:});
    end
    function varargout = set_domain(self,varargin)
    %SET_DOMAIN [INTERNAL] 
    %
    %  SET_DOMAIN(self, MX x, char domain)
    %
    %Set domain of a decision variable.
    %
    %Parameters:
    %-----------
    %
    %x: 
    %decision variable
    %
    %type: 
    %'real', 'integer' (default: real)
    %
    %
    %
    %::
    %
    %  * opti.set_domain(x, "real")
    %  * opti.set_domain(x, "integer")
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_27t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L221
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L189-L195
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1298, self, varargin{:});
    end
    function varargout = set_linear_scale(self,varargin)
    %SET_LINEAR_SCALE [INTERNAL] 
    %
    %  SET_LINEAR_SCALE(self, MX x, DM scale, DM offset)
    %
    %Set scale of a decision variable.
    %
    %(x-offset)/scale will be used in the optimization problem
    %
    %Parameters:
    %-----------
    %
    %x: 
    %decision variable
    %
    %scale: 
    %scaling value (default: 1)
    %
    %offset: 
    %scaling value (default: 0)
    %
    %
    %
    %::
    %
    %  * opti.set_linear_scale(x, 20)
    %  * opti.set_linear_scale(x, 20, 273.15)
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2bs
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L237
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L197-L203
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1299, self, varargin{:});
    end
    function varargout = solve(self,varargin)
    %SOLVE [INTERNAL] 
    %
    %  OptiSol = SOLVE(self)
    %
    %Crunch the numbers; solve the problem.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L240
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L213-L219
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1300, self, varargin{:});
    end
    function varargout = solve_limited(self,varargin)
    %SOLVE_LIMITED [INTERNAL] 
    %
    %  OptiSol = SOLVE_LIMITED(self)
    %
    %Crunch the numbers; solve the problem.
    %
    %Allows the solver to return without error when an iteration or time 
    %limit 
    %is reached
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L221-L227
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1301, self, varargin{:});
    end
    function varargout = value(self,varargin)
    %VALUE [INTERNAL] 
    %
    %  double = VALUE(self, DM x, {MX} values)
    %  double = VALUE(self, SX x, {MX} values)
    %  double = VALUE(self, MX x, {MX} values)
    %
    %Set domain of a decision variable.
    %
    %Parameters:
    %-----------
    %
    %x: 
    %decision variable
    %
    %type: 
    %'real', 'integer' (default: real)
    %
    %
    %
    %::
    %
    %  * opti.set_domain(x, "real")
    %  * opti.set_domain(x, "integer")
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_27t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L261
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L246-L252
    %
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, DM x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Set domain of a decision variable.
    %
    %Parameters:
    %-----------
    %
    %x: 
    %decision variable
    %
    %type: 
    %'real', 'integer' (default: real)
    %
    %
    %
    %::
    %
    %  * opti.set_domain(x, "real")
    %  * opti.set_domain(x, "integer")
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_27t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L260
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L238-L244
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, SX x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Set domain of a decision variable.
    %
    %Parameters:
    %-----------
    %
    %x: 
    %decision variable
    %
    %type: 
    %'real', 'integer' (default: real)
    %
    %
    %
    %::
    %
    %  * opti.set_domain(x, "real")
    %  * opti.set_domain(x, "integer")
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_27t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L261
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L246-L252
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, MX x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Obtain value of expression at the current value
    %
    %In regular mode, teh current value is the converged solution In debug 
    %mode,
    % the value can be non-converged
    %
    %Parameters:
    %-----------
    %
    %values: 
    %Optional assignment expressions (e.g. x==3) to overrule the current
    % 
    %value
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L259
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L229-L235
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1302, self, varargin{:});
    end
    function varargout = stats(self,varargin)
    %STATS [INTERNAL] 
    %
    %  struct = STATS(self)
    %
    %Get statistics.
    %
    %nlpsol stats are passed as-is. No stability can be guaranteed about 
    %this 
    %part of the API
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1f
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L270
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L262-L268
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1303, self, varargin{:});
    end
    function varargout = return_status(self,varargin)
    %RETURN_STATUS [INTERNAL] 
    %
    %  char = RETURN_STATUS(self)
    %
    %Get return status of solver.
    %
    %
    %
    %::
    %
    %     passed as-is from nlpsol
    %  
    %
    %No stability can be guaranteed about this part of the API
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L278
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L270-L276
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1304, self, varargin{:});
    end
    function varargout = initial(self,varargin)
    %INITIAL [INTERNAL] 
    %
    %  {MX} = INITIAL(self)
    %
    %get assignment expressions for initial values
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_266
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L283
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L278-L284
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1305, self, varargin{:});
    end
    function varargout = value_variables(self,varargin)
    %VALUE_VARIABLES [INTERNAL] 
    %
    %  {MX} = VALUE_VARIABLES(self)
    %
    %get assignment expressions for latest values
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_267
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L288
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L286-L292
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1306, self, varargin{:});
    end
    function varargout = value_parameters(self,varargin)
    %VALUE_PARAMETERS [INTERNAL] 
    %
    %  {MX} = VALUE_PARAMETERS(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1307, self, varargin{:});
    end
    function varargout = scale_helper(self,varargin)
    %SCALE_HELPER [INTERNAL] 
    %
    %  Function = SCALE_HELPER(self, Function h)
    %
    %Scale a helper function constructed via opti.x, opti.g, ...
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2ci
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L294
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L254-L260
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1308, self, varargin{:});
    end
    function varargout = dual(self,varargin)
    %DUAL [INTERNAL] 
    %
    %  MX = DUAL(self, MX m)
    %
    %get the dual variable
    %
    %m must be a constraint expression. The returned value is still a 
    %symbolic 
    %expression. Use  value on it to obtain the numerical value.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1h
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L303
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L302-L308
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1309, self, varargin{:});
    end
    function varargout = nx(self,varargin)
    %NX [INTERNAL] 
    %
    %  int = NX(self)
    %
    %Number of (scalarised) decision variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_268
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L308
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L310-L316
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1310, self, varargin{:});
    end
    function varargout = np(self,varargin)
    %NP [INTERNAL] 
    %
    %  int = NP(self)
    %
    %Number of (scalarised) parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_269
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L313
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L318-L324
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1311, self, varargin{:});
    end
    function varargout = ng(self,varargin)
    %NG [INTERNAL] 
    %
    %  int = NG(self)
    %
    %Number of (scalarised) constraints.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26a
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L318
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L326-L332
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1312, self, varargin{:});
    end
    function varargout = x(self,varargin)
    %X [INTERNAL] 
    %
    %  MX = X(self)
    %
    %Get all (scalarised) decision variables as a symbolic column 
    %vector.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L323
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L334-L340
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1313, self, varargin{:});
    end
    function varargout = p(self,varargin)
    %P [INTERNAL] 
    %
    %  MX = P(self)
    %
    %Get all (scalarised) parameters as a symbolic column vector.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L328
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L342-L348
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1314, self, varargin{:});
    end
    function varargout = g(self,varargin)
    %G [INTERNAL] 
    %
    %  MX = G(self)
    %
    %Get all (scalarised) constraint expressions as a column vector.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L333
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L350-L356
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1315, self, varargin{:});
    end
    function varargout = f(self,varargin)
    %F [INTERNAL] 
    %
    %  MX = F(self)
    %
    %Get objective expression.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L358-L364
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1316, self, varargin{:});
    end
    function varargout = lbg(self,varargin)
    %LBG [INTERNAL] 
    %
    %  MX = LBG(self)
    %
    %Get all (scalarised) bounds on constraints as a column vector.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_26f
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L343
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L366-L372
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1317, self, varargin{:});
    end
    function varargout = ubg(self,varargin)
    %UBG [INTERNAL] 
    %
    %  MX = UBG(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1318, self, varargin{:});
    end
    function varargout = x_linear_scale(self,varargin)
    %X_LINEAR_SCALE [INTERNAL] 
    %
    %  DM = X_LINEAR_SCALE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1319, self, varargin{:});
    end
    function varargout = x_linear_scale_offset(self,varargin)
    %X_LINEAR_SCALE_OFFSET [INTERNAL] 
    %
    %  DM = X_LINEAR_SCALE_OFFSET(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1320, self, varargin{:});
    end
    function varargout = g_linear_scale(self,varargin)
    %G_LINEAR_SCALE [INTERNAL] 
    %
    %  DM = G_LINEAR_SCALE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1321, self, varargin{:});
    end
    function varargout = f_linear_scale(self,varargin)
    %F_LINEAR_SCALE [INTERNAL] 
    %
    %  double = F_LINEAR_SCALE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1322, self, varargin{:});
    end
    function varargout = lam_g(self,varargin)
    %LAM_G [INTERNAL] 
    %
    %  MX = LAM_G(self)
    %
    %Get all (scalarised) dual variables as a symbolic column vector.
    %
    %Useful for obtaining the Lagrange Hessian:
    %
    %::
    %
    %  * sol.value(hessian(opti.f+opti.lam_g'*opti.g,opti.x)) % MATLAB
    %  * sol.value(hessian(opti.f+dot(opti.lam_g,opti.g),opti.x)[0]) # Python
    %  * 
    %
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1i
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L360
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L383-L389
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1323, self, varargin{:});
    end
    function varargout = to_function(self,varargin)
    %TO_FUNCTION [INTERNAL] 
    %
    %  Function = TO_FUNCTION(self, char name, {MX} args, {MX} res, struct opts)
    %  Function = TO_FUNCTION(self, char name, struct:MX dict, {char} name_in, {char} name_out, struct opts)
    %  Function = TO_FUNCTION(self, char name, {MX} args, {MX} res, {char} name_in, {char} name_out, struct opts)
    %
    %Create a CasADi  Function from the  Opti solver.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name of the resulting CasADi  Function
    %
    %args: 
    %List of parameters and decision/dual variables (which can be given an
    % 
    %initial guess) with the resulting  Function
    %
    %res: 
    %List of expressions that will get evaluated at the optimal solution
    %
    %opts: 
    %Standard CasADi Funcion options
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L382
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L441-L461
    %
    %
    %
    %.......
    %
    %::
    %
    %  TO_FUNCTION(self, char name, {MX} args, {MX} res, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a CasADi  Function from the  Opti solver.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name of the resulting CasADi  Function
    %
    %args: 
    %List of parameters and decision/dual variables (which can be given an
    % 
    %initial guess) with the resulting  Function
    %
    %res: 
    %List of expressions that will get evaluated at the optimal solution
    %
    %opts: 
    %Standard CasADi Funcion options
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L372
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L435-L439
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  TO_FUNCTION(self, char name, struct:MX dict, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a CasADi  Function from the  Opti solver.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name of the resulting CasADi  Function
    %
    %args: 
    %List of parameters and decision/dual variables (which can be given an
    % 
    %initial guess) with the resulting  Function
    %
    %res: 
    %List of expressions that will get evaluated at the optimal solution
    %
    %opts: 
    %Standard CasADi Funcion options
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L382
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L441-L461
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  TO_FUNCTION(self, char name, {MX} args, {MX} res, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a CasADi  Function from the  Opti solver.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name of the resulting CasADi  Function
    %
    %args: 
    %List of parameters and decision/dual variables (which can be given an
    % 
    %initial guess) with the resulting  Function
    %
    %res: 
    %List of expressions that will get evaluated at the optimal solution
    %
    %opts: 
    %Standard CasADi Funcion options
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L376
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L423-L433
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1324, self, varargin{:});
    end
    function varargout = debug(self,varargin)
    %DEBUG [INTERNAL] 
    %
    %  OptiAdvanced = DEBUG(self)
    %
    %Get a copy with advanced functionality.
    %
    %You get access to more methods, but you have no guarantees about API 
    %
    %stability
    %
    %The copy is effectively a deep copy: Updating the state of the copy 
    %does 
    %not update the original.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1l
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L408
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L847-L849
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1325, self, varargin{:});
    end
    function varargout = advanced(self,varargin)
    %ADVANCED [INTERNAL] 
    %
    %  OptiAdvanced = ADVANCED(self)
    %
    %Get a copy with advanced functionality.
    %
    %You get access to more methods, but you have no guarantees about API 
    %
    %stability
    %
    %The copy is effectively a deep copy: Updating the state of the copy 
    %does 
    %not update the original.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1m
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L418
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L850-L852
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1326, self, varargin{:});
    end
    function varargout = copy(self,varargin)
    %COPY [INTERNAL] 
    %
    %  Opti = COPY(self)
    %
    %Get a copy of the.
    %
    %The copy is effectively a deep copy: Updating the state of the copy 
    %does 
    %not update the original.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1n
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L426
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L853-L855
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1327, self, varargin{:});
    end
    function varargout = update_user_dict(self,varargin)
    %UPDATE_USER_DICT [INTERNAL] 
    %
    %  UPDATE_USER_DICT(self, MX m, struct meta)
    %  UPDATE_USER_DICT(self, {MX} m, struct meta)
    %
    %
    %.......
    %
    %::
    %
    %  UPDATE_USER_DICT(self, MX m, struct meta)
    %
    %
    %
    %[INTERNAL] 
    %add user data
    %
    %Add arbitrary data in the form of a dictionary to symbols or 
    %constraints
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1o
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L434
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L479-L485
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  UPDATE_USER_DICT(self, {MX} m, struct meta)
    %
    %
    %
    %[INTERNAL] 
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1328, self, varargin{:});
    end
    function varargout = user_dict(self,varargin)
    %USER_DICT [INTERNAL] 
    %
    %  struct = USER_DICT(self, MX m)
    %
    %Get user data.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L437
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L492-L498
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1329, self, varargin{:});
    end
    function varargout = type_name(self,varargin)
    %TYPE_NAME [INTERNAL] 
    %
    %  char = TYPE_NAME(self)
    %
    %Readable name of the class.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L440
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L440-L440
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1330, self, varargin{:});
    end
    function varargout = disp(self,varargin)
    %DISP [INTERNAL] 
    %
    %  std::ostream & = DISP(self, bool more)
    %
    %Print representation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L443
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L750-L770
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1331, self, varargin{:});
    end
    function varargout = str(self,varargin)
    %STR [INTERNAL] 
    %
    %  char = STR(self, bool more)
    %
    %Get string representation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L446
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L772-L776
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1332, self, varargin{:});
    end
    function varargout = callback_class(self,varargin)
    %CALLBACK_CLASS [INTERNAL] 
    %
    %  CALLBACK_CLASS(self)
    %  CALLBACK_CLASS(self, OptiCallback callback)
    %
    %Helper methods for callback()
    %
    %Do not use directly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L455
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L471-L477
    %
    %
    %
    %.......
    %
    %::
    %
    %  CALLBACK_CLASS(self)
    %
    %
    %
    %[INTERNAL] 
    %Helper methods for callback()
    %
    %Do not use directly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L455
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L471-L477
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  CALLBACK_CLASS(self, OptiCallback callback)
    %
    %
    %
    %[INTERNAL] 
    %Helper methods for callback()
    %
    %Do not use directly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L454
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L463-L469
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1333, self, varargin{:});
    end

      function out = variable(self, varargin)
        st = dbstack('-completenames',1);
        if length(st)>0
          meta = struct('stacktrace', {num2cell(st)});
        else
          meta = struct;
        end
        out = self.internal_variable(varargin{:});
        self.update_user_dict(out, meta);
      end
      function out = parameter(self, varargin)
        st = dbstack('-completenames',1);
        if length(st)>0
          meta = struct('stacktrace', {num2cell(st)});
        else
          meta = struct;
        end
        out = self.internal_parameter(varargin{:});
        self.update_user_dict(out, meta);
      end
      function [] = subject_to(self, varargin)
        if length(varargin)==0
          self.internal_subject_to();
          return;
        end
        st = dbstack('-completenames',1);
        if length(st)>0
          meta = struct('stacktrace', {num2cell(st)});
        else
          meta = struct;
        end
        self.internal_subject_to(varargin{:});
        self.update_user_dict(varargin{1}, meta);
      end
    
    function [] = callback(self, varargin)
      casadi.OptiCallbackHelper.callback_setup(self, varargin{:})
    end
      function self = Opti(varargin)
    %OPTI 
    %
    %  new_obj = OPTI(char problem_type)
    %
    %
      self@casadi.PrintableCommon(SwigRef.Null);
      self@casadi.SharedObject(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1334, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1335, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
