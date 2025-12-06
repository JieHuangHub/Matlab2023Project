classdef  DaeBuilder < casadi.SharedObject & casadi.PrintableCommon
    %DAEBUILDER [INTERNAL] 
    %
    %
    %A symbolic representation of a differential-algebraic equations 
    %model.
    %
    %Variables:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  t:      independent variable (usually time)
    %  c:      constants
    %  p:      parameters
    %  d:      dependent parameters (time independent)
    %  u:      controls
    %  w:      dependent variables  (time dependent)
    %  x:      differential states
    %  z:      algebraic variables
    %  q:      quadrature states
    %  y:      outputs
    %  
    %
    %
    %
    %Equations:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  differential equations: \\dot{x} ==  ode(...)
    %  algebraic equations:          0 ==  alg(...)
    %  quadrature equations:   \\dot{q} == quad(...)
    %  dependent parameters:         d == ddef(d_prev,p)
    %  dependent variables:          w == wdef(w_prev,x,z,u,p,t)
    %  output equations:             y == ydef(...)
    %  initial equations:     init_lhs == init_rhs(...)
    %  events:      when when_cond < 0: when_lhs := when_rhs
    %  
    %
    %
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5c
    %
    %C++ includes: dae_builder.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = type_name(self,varargin)
    %TYPE_NAME [INTERNAL] 
    %
    %  char = TYPE_NAME(self)
    %
    %Readable name of the class.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74-L74
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1043, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Name of instance.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L86
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L59-L61
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1044, self, varargin{:});
    end
    function varargout = time(self,varargin)
    %TIME [INTERNAL] 
    %
    %  MX = TIME(self)
    %
    %Expression for independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2by
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L93
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L63-L71
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1045, self, varargin{:});
    end
    function varargout = t_new(self,varargin)
    %T_NEW [INTERNAL] 
    %
    %  {char} = T_NEW(self)
    %
    %Independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2bz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1046, self, varargin{:});
    end
    function varargout = x(self,varargin)
    %X [INTERNAL] 
    %
    %  {char} = X(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5f
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103-L103
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1047, self, varargin{:});
    end
    function varargout = y(self,varargin)
    %Y [INTERNAL] 
    %
    %  {char} = Y(self)
    %
    %Outputs */.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L106
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L73-L80
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1048, self, varargin{:});
    end
    function varargout = ode(self,varargin)
    %ODE [INTERNAL] 
    %
    %  {MX} = ODE(self)
    %
    %Ordinary differential equations (ODE)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L111
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L82-L89
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1049, self, varargin{:});
    end
    function varargout = z(self,varargin)
    %Z [INTERNAL] 
    %
    %  {char} = Z(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5h
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L116
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L116-L116
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1050, self, varargin{:});
    end
    function varargout = alg(self,varargin)
    %ALG [INTERNAL] 
    %
    %  {MX} = ALG(self)
    %
    %Algebraic equations.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5i
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L121
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L91-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1051, self, varargin{:});
    end
    function varargout = q(self,varargin)
    %Q [INTERNAL] 
    %
    %  {char} = Q(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L126
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L126-L126
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1052, self, varargin{:});
    end
    function varargout = quad(self,varargin)
    %QUAD [INTERNAL] 
    %
    %  {MX} = QUAD(self)
    %
    %Quadrature equations.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5k
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L100-L107
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1053, self, varargin{:});
    end
    function varargout = zero(self,varargin)
    %ZERO [INTERNAL] 
    %
    %  {MX} = ZERO(self)
    %
    %Zero-crossing functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L136
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L109-L115
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1054, self, varargin{:});
    end
    function varargout = ydef(self,varargin)
    %YDEF [INTERNAL] 
    %
    %  {MX} = YDEF(self)
    %
    %Definitions of output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5m
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L141
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L117-L124
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1055, self, varargin{:});
    end
    function varargout = set_y(self,varargin)
    %SET_Y [INTERNAL] 
    %
    %  SET_Y(self, {char} name)
    %
    %Set all output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2db
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L146
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L126-L160
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1056, self, varargin{:});
    end
    function varargout = rate(self,varargin)
    %RATE [INTERNAL] 
    %
    %  {char} = RATE(self)
    %
    %Get all rate variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2dc
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L151
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L162-L169
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1057, self, varargin{:});
    end
    function varargout = set_rate(self,varargin)
    %SET_RATE [INTERNAL] 
    %
    %  SET_RATE(self, {char} name)
    %
    %Set rate variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2dd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L156
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L171-L178
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1058, self, varargin{:});
    end
    function varargout = u(self,varargin)
    %U [INTERNAL] 
    %
    %  {char} = U(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5n
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L161
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L161-L161
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1059, self, varargin{:});
    end
    function varargout = p(self,varargin)
    %P [INTERNAL] 
    %
    %  {char} = P(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5o
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L166
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L166-L166
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1060, self, varargin{:});
    end
    function varargout = c(self,varargin)
    %C [INTERNAL] 
    %
    %  {char} = C(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L171
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L171-L171
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1061, self, varargin{:});
    end
    function varargout = cdef(self,varargin)
    %CDEF [INTERNAL] 
    %
    %  {MX} = CDEF(self)
    %
    %Definitions of named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5q
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L176
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L180-L187
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1062, self, varargin{:});
    end
    function varargout = d(self,varargin)
    %D [INTERNAL] 
    %
    %  {char} = D(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L181
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L181-L181
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1063, self, varargin{:});
    end
    function varargout = ddef(self,varargin)
    %DDEF [INTERNAL] 
    %
    %  {MX} = DDEF(self)
    %
    %Definitions of dependent parameters.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L188
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L189-L196
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1064, self, varargin{:});
    end
    function varargout = w(self,varargin)
    %W [INTERNAL] 
    %
    %  {char} = W(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L193
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L193-L193
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1065, self, varargin{:});
    end
    function varargout = wdef(self,varargin)
    %WDEF [INTERNAL] 
    %
    %  {MX} = WDEF(self)
    %
    %Dependent variables and corresponding definitions.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L200
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L198-L205
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1066, self, varargin{:});
    end
    function varargout = init_lhs(self,varargin)
    %INIT_LHS [INTERNAL] 
    %
    %  {MX} = INIT_LHS(self)
    %
    %Initial conditions, left-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L205
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L207-L209
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1067, self, varargin{:});
    end
    function varargout = init_rhs(self,varargin)
    %INIT_RHS [INTERNAL] 
    %
    %  {MX} = INIT_RHS(self)
    %
    %Initial conditions, right-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L210
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L211-L213
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1068, self, varargin{:});
    end
    function varargout = outputs(self,varargin)
    %OUTPUTS [INTERNAL] 
    %
    %  {char} = OUTPUTS(self)
    %
    %Model structure: outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_61
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L215
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L215-L222
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1069, self, varargin{:});
    end
    function varargout = derivatives(self,varargin)
    %DERIVATIVES [INTERNAL] 
    %
    %  {char} = DERIVATIVES(self)
    %
    %Model structure: derivatives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_62
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L220
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L224-L231
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1070, self, varargin{:});
    end
    function varargout = initial_unknowns(self,varargin)
    %INITIAL_UNKNOWNS [INTERNAL] 
    %
    %  {char} = INITIAL_UNKNOWNS(self)
    %
    %Model structure: initial unknowns.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_63
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L225
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L233-L240
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1071, self, varargin{:});
    end
    function varargout = has_t(self,varargin)
    %HAS_T [INTERNAL] 
    %
    %  bool = HAS_T(self)
    %
    %Is there a time variable?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_64
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L242-L249
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1072, self, varargin{:});
    end
    function varargout = has_rate(self,varargin)
    %HAS_RATE [INTERNAL] 
    %
    %  bool = HAS_RATE(self)
    %
    %Is there a rate output?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2dg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L238
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L251-L258
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1073, self, varargin{:});
    end
    function varargout = nx(self,varargin)
    %NX [INTERNAL] 
    %
    %  int = NX(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_65
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L243
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L260-L262
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1074, self, varargin{:});
    end
    function varargout = nz(self,varargin)
    %NZ [INTERNAL] 
    %
    %  int = NZ(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_66
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L264-L266
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1075, self, varargin{:});
    end
    function varargout = nq(self,varargin)
    %NQ [INTERNAL] 
    %
    %  int = NQ(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_67
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L253
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L268-L270
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1076, self, varargin{:});
    end
    function varargout = nzero(self,varargin)
    %NZERO [INTERNAL] 
    %
    %  int = NZERO(self)
    %
    %Zero-crossing functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2cb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L258
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L272-L274
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1077, self, varargin{:});
    end
    function varargout = ny(self,varargin)
    %NY [INTERNAL] 
    %
    %  int = NY(self)
    %
    % Output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_68
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L263
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L276-L278
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1078, self, varargin{:});
    end
    function varargout = nu(self,varargin)
    %NU [INTERNAL] 
    %
    %  int = NU(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_69
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L268
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L280-L282
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1079, self, varargin{:});
    end
    function varargout = np(self,varargin)
    %NP [INTERNAL] 
    %
    %  int = NP(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6a
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L273
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L284-L286
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1080, self, varargin{:});
    end
    function varargout = nc(self,varargin)
    %NC [INTERNAL] 
    %
    %  int = NC(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L278
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L288-L290
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1081, self, varargin{:});
    end
    function varargout = nd(self,varargin)
    %ND [INTERNAL] 
    %
    %  int = ND(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L283
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L292-L294
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1082, self, varargin{:});
    end
    function varargout = nw(self,varargin)
    %NW [INTERNAL] 
    %
    %  int = NW(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L288
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L296-L298
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1083, self, varargin{:});
    end
    function varargout = add(self,varargin)
    %ADD [INTERNAL] 
    %
    %  MX = ADD(self, char name, struct opts)
    %  MX = ADD(self, char name, char causality, struct opts)
    %  MX = ADD(self, char name, char causality, char variability, struct opts)
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L312
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L659-L672
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L312
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L659-L672
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
    %  ADD(self, char name, char causality, char variability, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L297
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L630-L639
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
    %  ADD(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability and causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L308
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L650-L657
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
    %  ADD(self, char name, char causality, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L303
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L641-L648
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1084, self, varargin{:});
    end
    function varargout = t(self,varargin)
    %T [DEPRECATED] Renamed "time"
    %
    %  MX = T(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L320
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L320-L320
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1085, self, varargin{:});
    end
    function varargout = add_t(self,varargin)
    %ADD_T [DEPRECATED] Replaced by add
    %
    %  MX = ADD_T(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L323
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L675-L677
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1086, self, varargin{:});
    end
    function varargout = add_p(self,varargin)
    %ADD_P [DEPRECATED] Replaced by add
    %
    %  MX = ADD_P(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L326
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L679-L682
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1087, self, varargin{:});
    end
    function varargout = add_u(self,varargin)
    %ADD_U [DEPRECATED] Replaced by add
    %
    %  MX = ADD_U(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L329
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L684-L687
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1088, self, varargin{:});
    end
    function varargout = add_x(self,varargin)
    %ADD_X [DEPRECATED] Replaced by add
    %
    %  MX = ADD_X(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L332
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L689-L692
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1089, self, varargin{:});
    end
    function varargout = add_z(self,varargin)
    %ADD_Z [DEPRECATED] Replaced by add
    %
    %  MX = ADD_Z(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L335
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L694-L697
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1090, self, varargin{:});
    end
    function varargout = add_q(self,varargin)
    %ADD_Q [DEPRECATED] Replaced by add
    %
    %  MX = ADD_Q(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L699-L702
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1091, self, varargin{:});
    end
    function varargout = add_c(self,varargin)
    %ADD_C [DEPRECATED] Replaced by add and eq
    %
    %  MX = ADD_C(self, char name, MX new_cdef)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L341
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L704-L708
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1092, self, varargin{:});
    end
    function varargout = add_d(self,varargin)
    %ADD_D [DEPRECATED] Replaced by add and eq
    %
    %  MX = ADD_D(self, char name, MX new_ddef)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L344
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L710-L714
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1093, self, varargin{:});
    end
    function varargout = add_w(self,varargin)
    %ADD_W [DEPRECATED] Replaced by add and eq
    %
    %  MX = ADD_W(self, char name, MX new_wdef)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L347
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L716-L720
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1094, self, varargin{:});
    end
    function varargout = add_y(self,varargin)
    %ADD_Y [DEPRECATED] Replaced by add and eq
    %
    %  MX = ADD_Y(self, char name, MX new_ydef)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L350
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L722-L726
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1095, self, varargin{:});
    end
    function varargout = set_beq(self,varargin)
    %SET_BEQ [DEPRECATED] Replaced by eq
    %
    %  SET_BEQ(self, char name, MX val)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L353
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L728-L734
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1096, self, varargin{:});
    end
    function varargout = eq(self,varargin)
    %EQ [INTERNAL] 
    %
    %  EQ(self, MX lhs, MX rhs, struct opts)
    %
    %Add a simple equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L358
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L738-L744
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1097, self, varargin{:});
    end
    function varargout = when(self,varargin)
    %WHEN [INTERNAL] 
    %
    %  WHEN(self, MX cond, {char} eqs, struct opts)
    %
    %Add when equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L361
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L746-L752
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1098, self, varargin{:});
    end
    function varargout = assign(self,varargin)
    %ASSIGN [INTERNAL] 
    %
    %  char = ASSIGN(self, char name, MX val)
    %
    %Assignment inside a when-equation or if-else equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L364
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L754-L761
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1099, self, varargin{:});
    end
    function varargout = reinit(self,varargin)
    %REINIT [INTERNAL] 
    %
    %  char = REINIT(self, char name, MX val)
    %
    %Reinitialize a state inside when-equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L367
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L763-L770
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1100, self, varargin{:});
    end
    function varargout = set_init(self,varargin)
    %SET_INIT [INTERNAL] 
    %
    %  SET_INIT(self, char name, MX init_rhs)
    %
    %Specify the initial equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L370
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L772-L778
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1101, self, varargin{:});
    end
    function varargout = set_ode(self,varargin)
    %SET_ODE [DEPRECATED] Replaced by eq
    %
    %  SET_ODE(self, char name, MX ode_rhs)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L374
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L374-L376
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1102, self, varargin{:});
    end
    function varargout = set_alg(self,varargin)
    %SET_ALG [DEPRECATED] Replaced by eq
    %
    %  SET_ALG(self, char name, MX alg_rhs)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L379
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L379-L382
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1103, self, varargin{:});
    end
    function varargout = add_init(self,varargin)
    %ADD_INIT [DEPRECATED] Replaced by set_init
    %
    %  ADD_INIT(self, MX lhs, MX rhs)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L385
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L385-L387
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1104, self, varargin{:});
    end
    function varargout = ne(self,varargin)
    %NE [DEPRECATED] Replaced by  nzero()
    %
    %  int = NE(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L390
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L390-L390
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1105, self, varargin{:});
    end
    function varargout = e(self,varargin)
    %E [DEPRECATED] Use all("zero") */
    %
    %  {char} = E(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L393
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L393-L393
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1106, self, varargin{:});
    end
    function varargout = sanity_check(self,varargin)
    %SANITY_CHECK [INTERNAL] 
    %
    %  SANITY_CHECK(self)
    %
    %Check if dimensions match.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L398
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L780-L786
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1107, self, varargin{:});
    end
    function varargout = reorder(self,varargin)
    %REORDER [INTERNAL] 
    %
    %  REORDER(self, char cat, {char} v)
    %
    %Reorder variables in a category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L402
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L615-L628
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1108, self, varargin{:});
    end
    function varargout = clear_all(self,varargin)
    %CLEAR_ALL [DEPRECATED] Use set_variability, set_causality or set_category to 
    %
    %  CLEAR_ALL(self, char v)
    %
    %change 
    %variable category
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L406
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L590-L597
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1109, self, varargin{:});
    end
    function varargout = set_all(self,varargin)
    %SET_ALL [DEPRECATED] Use set_variability, set_causality, set_category and/or 
    %
    %  SET_ALL(self, char v, {char} name)
    %
    %
    %reorder
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L409
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L599-L611
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1110, self, varargin{:});
    end
    function varargout = register_t(self,varargin)
    %REGISTER_T [INTERNAL] 
    %
    %  REGISTER_T(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1111, self, varargin{:});
    end
    function varargout = register_p(self,varargin)
    %REGISTER_P [INTERNAL] 
    %
    %  REGISTER_P(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1112, self, varargin{:});
    end
    function varargout = register_u(self,varargin)
    %REGISTER_U [INTERNAL] 
    %
    %  REGISTER_U(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1113, self, varargin{:});
    end
    function varargout = register_x(self,varargin)
    %REGISTER_X [INTERNAL] 
    %
    %  REGISTER_X(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1114, self, varargin{:});
    end
    function varargout = register_z(self,varargin)
    %REGISTER_Z [INTERNAL] 
    %
    %  REGISTER_Z(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1115, self, varargin{:});
    end
    function varargout = register_q(self,varargin)
    %REGISTER_Q [INTERNAL] 
    %
    %  REGISTER_Q(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1116, self, varargin{:});
    end
    function varargout = register_c(self,varargin)
    %REGISTER_C [INTERNAL] 
    %
    %  REGISTER_C(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1117, self, varargin{:});
    end
    function varargout = register_d(self,varargin)
    %REGISTER_D [INTERNAL] 
    %
    %  REGISTER_D(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1118, self, varargin{:});
    end
    function varargout = register_w(self,varargin)
    %REGISTER_W [INTERNAL] 
    %
    %  REGISTER_W(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1119, self, varargin{:});
    end
    function varargout = register_y(self,varargin)
    %REGISTER_Y [INTERNAL] 
    %
    %  REGISTER_Y(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1120, self, varargin{:});
    end
    function varargout = register_e(self,varargin)
    %REGISTER_E [INTERNAL] 
    %
    %  REGISTER_E(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1121, self, varargin{:});
    end
    function varargout = eliminate_d(self,varargin)
    %ELIMINATE_D [DEPRECATED] Use eliminate("d")
    %
    %  ELIMINATE_D(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L427
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L542-L548
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1122, self, varargin{:});
    end
    function varargout = eliminate_w(self,varargin)
    %ELIMINATE_W [DEPRECATED] Use eliminate("w")
    %
    %  ELIMINATE_W(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L430
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L550-L556
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1123, self, varargin{:});
    end
    function varargout = eliminate_quad(self,varargin)
    %ELIMINATE_QUAD [DEPRECATED] Use eliminate("q")
    %
    %  ELIMINATE_QUAD(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L433
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L558-L564
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1124, self, varargin{:});
    end
    function varargout = sort_d(self,varargin)
    %SORT_D [DEPRECATED] Use sort("d")
    %
    %  SORT_D(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L436
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L566-L572
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1125, self, varargin{:});
    end
    function varargout = sort_w(self,varargin)
    %SORT_W [DEPRECATED] Use sort("w")
    %
    %  SORT_W(self)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L439
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L574-L580
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1126, self, varargin{:});
    end
    function varargout = sort_z(self,varargin)
    %SORT_Z [DEPRECATED] Use reorder("z", new_order)
    %
    %  SORT_Z(self, {char} z_order)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L442
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L582-L588
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1127, self, varargin{:});
    end
    function varargout = eliminate(self,varargin)
    %ELIMINATE [INTERNAL] 
    %
    %  ELIMINATE(self, char cat)
    %
    %Eliminate all dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L453
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L883-L889
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1128, self, varargin{:});
    end
    function varargout = sort(self,varargin)
    %SORT [INTERNAL] 
    %
    %  SORT(self, char cat)
    %
    %Sort dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L456
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L891-L897
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1129, self, varargin{:});
    end
    function varargout = lift(self,varargin)
    %LIFT [INTERNAL] 
    %
    %  LIFT(self, bool lift_shared, bool lift_calls)
    %
    %Lift problem formulation by extracting shared subexpressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L459
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L899-L905
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1130, self, varargin{:});
    end
    function varargout = prune(self,varargin)
    %PRUNE [INTERNAL] 
    %
    %  PRUNE(self, bool prune_p, bool prune_u)
    %
    %Prune unused controls.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L326-L332
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1131, self, varargin{:});
    end
    function varargout = tear(self,varargin)
    %TEAR [INTERNAL] 
    %
    %  TEAR(self)
    %
    %Identify iteration variables and residual equations using naming
    % 
    %convention.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L465
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L334-L340
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1132, self, varargin{:});
    end
    function varargout = add_fun(self,varargin)
    %ADD_FUN [INTERNAL] 
    %
    %  Function = ADD_FUN(self, Function f)
    %  Function = ADD_FUN(self, char name, Importer compiler, struct opts)
    %  Function = ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L482
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1153-L1156
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD_FUN(self, Function f)
    %
    %
    %
    %[INTERNAL] 
    %Add an already existing function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L479
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1134-L1141
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
    %  ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a function from loaded expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L474
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1143-L1151
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
    %  ADD_FUN(self, char name, Importer compiler, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L482
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1153-L1156
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1133, self, varargin{:});
    end
    function varargout = has_fun(self,varargin)
    %HAS_FUN [INTERNAL] 
    %
    %  bool = HAS_FUN(self, char name)
    %
    %Does a particular function already exist?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L486
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1158-L1165
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1134, self, varargin{:});
    end
    function varargout = fun(self,varargin)
    %FUN [INTERNAL] 
    %
    %  {Function} = FUN(self)
    %  Function = FUN(self, char name)
    %
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L492
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1197-L1199
    %
    %
    %
    %.......
    %
    %::
    %
    %  FUN(self, char name)
    %
    %
    %
    %[INTERNAL] 
    %Get function by name.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L489
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1167-L1174
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
    %  FUN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L492
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1197-L1199
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1135, self, varargin{:});
    end
    function varargout = gather_fun(self,varargin)
    %GATHER_FUN [INTERNAL] 
    %
    %  GATHER_FUN(self, int max_depth)
    %
    %Collect embedded functions from the expression graph.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L495
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1176-L1195
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1136, self, varargin{:});
    end
    function varargout = parse_fmi(self,varargin)
    %PARSE_FMI [INTERNAL] 
    %
    %  PARSE_FMI(self, char filename)
    %
    %Import existing problem from FMI/XML
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L502
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L502-L502
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1137, self, varargin{:});
    end
    function varargout = provides_directional_derivatives(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVES [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVES(self)
    %
    %Does the FMU provide support for analytic derivatives.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L505
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L308-L316
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1138, self, varargin{:});
    end
    function varargout = provides_directional_derivative(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVE [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVE(self)
    %
    %Does the FMU provide support for analytic derivatives (FMI 2 
    %naming)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L508
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L508-L508
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1139, self, varargin{:});
    end
    function varargout = load_fmi_description(self,varargin)
    %LOAD_FMI_DESCRIPTION [INTERNAL] 
    %
    %  LOAD_FMI_DESCRIPTION(self, char filename)
    %
    %Import problem description from FMI or XML.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L511
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L300-L306
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1140, self, varargin{:});
    end
    function varargout = export_fmu(self,varargin)
    %EXPORT_FMU [INTERNAL] 
    %
    %  {char} = EXPORT_FMU(self, struct opts)
    %
    %Export instance into an FMU.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L514
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L318-L324
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1141, self, varargin{:});
    end
    function varargout = add_lc(self,varargin)
    %ADD_LC [INTERNAL] 
    %
    %  ADD_LC(self, char name, {char} f_out)
    %
    %Add a named linear combination of output expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L517
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1094-L1101
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1142, self, varargin{:});
    end
    function varargout = create(self,varargin)
    %CREATE [INTERNAL] 
    %
    %  Function = CREATE(self)
    %  Function = CREATE(self, char fname, struct opts)
    %  Function = CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %  Function = CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L549
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L549-L549
    %
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, names provided.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %name_in: 
    %Names of all the inputs
    %
    %name_out: 
    %Names of all the outputs
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L532
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1114-L1123
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
    %  CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, legacy syntax.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L520
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1103-L1112
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
    %  CREATE(self)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L549
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L549-L549
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
    %  CREATE(self, char fname, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L544
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1125-L1132
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1143, self, varargin{:});
    end
    function varargout = dependent_fun(self,varargin)
    %DEPENDENT_FUN [INTERNAL] 
    %
    %  Function = DEPENDENT_FUN(self, char fname, {char} s_in, {char} s_out)
    %
    %Construct a function for evaluating dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L552
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1210-L1219
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1144, self, varargin{:});
    end
    function varargout = transition(self,varargin)
    %TRANSITION [INTERNAL] 
    %
    %  Function = TRANSITION(self)
    %  Function = TRANSITION(self, char fname)
    %  Function = TRANSITION(self, char fname, int index)
    %
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L563
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L563-L563
    %
    %
    %
    %.......
    %
    %::
    %
    %  TRANSITION(self)
    %
    %
    %
    %[INTERNAL] 
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L563
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L563-L563
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
    %  TRANSITION(self, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at any events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L560
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1230-L1237
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
    %  TRANSITION(self, char fname, int index)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at a specific events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L557
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1221-L1228
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1145, self, varargin{:});
    end
    function varargout = var(self,varargin)
    %VAR [INTERNAL] 
    %
    %  MX = VAR(self, char name)
    %
    %Get variable expression by name
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L567
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L788-L795
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1146, self, varargin{:});
    end
    function varargout = paren(self,varargin)
    %PAREN 
    %
    %  MX = PAREN(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1147, self, varargin{:});
    end
    function varargout = der(self,varargin)
    %DER [INTERNAL] 
    %
    %  {char} = DER(self, {char} name)
    %  MX = DER(self, MX v)
    %  MX = DER(self, MX v)
    %
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L577
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1260-L1267
    %
    %
    %
    %.......
    %
    %::
    %
    %  DER(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the time derivative of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L572
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L842-L851
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
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L577
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1260-L1267
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
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L576
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1251-L1258
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1148, self, varargin{:});
    end
    function varargout = pre(self,varargin)
    %PRE [INTERNAL] 
    %
    %  {char} = PRE(self, {char} name)
    %  MX = PRE(self, MX v)
    %
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L584
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L827-L840
    %
    %
    %
    %.......
    %
    %::
    %
    %  PRE(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L584
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L827-L840
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
    %  PRE(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-variables of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L581
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L853-L862
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1149, self, varargin{:});
    end
    function varargout = has_beq(self,varargin)
    %HAS_BEQ [INTERNAL] 
    %
    %  bool = HAS_BEQ(self, char name)
    %
    %Does a variable have a binding equation?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L587
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L864-L871
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1150, self, varargin{:});
    end
    function varargout = beq(self,varargin)
    %BEQ [INTERNAL] 
    %
    %  MX = BEQ(self, char name)
    %
    %Get the binding equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L590
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L873-L881
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1151, self, varargin{:});
    end
    function varargout = value_reference(self,varargin)
    %VALUE_REFERENCE [INTERNAL] 
    %
    %  int = VALUE_REFERENCE(self, char name)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L594
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L907-L909
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1152, self, varargin{:});
    end
    function varargout = set_value_reference(self,varargin)
    %SET_VALUE_REFERENCE [INTERNAL] 
    %
    %  SET_VALUE_REFERENCE(self, char name, int val)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L595
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L911-L913
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1153, self, varargin{:});
    end
    function varargout = description(self,varargin)
    %DESCRIPTION [INTERNAL] 
    %
    %  char = DESCRIPTION(self, char name)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L600
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L915-L917
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1154, self, varargin{:});
    end
    function varargout = set_description(self,varargin)
    %SET_DESCRIPTION [INTERNAL] 
    %
    %  SET_DESCRIPTION(self, char name, char val)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L601
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L919-L921
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1155, self, varargin{:});
    end
    function varargout = type(self,varargin)
    %TYPE [INTERNAL] 
    %
    %  char = TYPE(self, char name, int fmi_version)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L606
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L923-L932
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1156, self, varargin{:});
    end
    function varargout = set_type(self,varargin)
    %SET_TYPE [INTERNAL] 
    %
    %  SET_TYPE(self, char name, char val)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L607
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L934-L941
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1157, self, varargin{:});
    end
    function varargout = causality(self,varargin)
    %CAUSALITY [INTERNAL] 
    %
    %  char = CAUSALITY(self, char name)
    %
    %Get the causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L611
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L943-L950
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1158, self, varargin{:});
    end
    function varargout = set_causality(self,varargin)
    %SET_CAUSALITY [INTERNAL] 
    %
    %  SET_CAUSALITY(self, char name, char val)
    %
    %Set the causality, if permitted.
    %
    %The following changes are permitted: For controls 'u' (variability 
    %
    %'continuous', causality 'input'), free parameters 'p' (variability 
    %
    %'tunable', causality 'parameter') and fixed parameters 'c' 
    %(variability 
    %'fixed', causality 'parameter'), causality can only be 
    %changed indirectly, 
    %by updating the variability Add or remove an 
    %output 'y' by setting the 
    %causality to 'output' or 'local', 
    %respectively
    %
    %No other changes are permitted.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L626
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L952-L958
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1159, self, varargin{:});
    end
    function varargout = variability(self,varargin)
    %VARIABILITY [INTERNAL] 
    %
    %  char = VARIABILITY(self, char name)
    %
    %Get the variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L629
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L960-L967
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1160, self, varargin{:});
    end
    function varargout = set_variability(self,varargin)
    %SET_VARIABILITY [INTERNAL] 
    %
    %  SET_VARIABILITY(self, char name, char val)
    %
    %Set the variability, if permitted.
    %
    %For controls 'u' (variability 'continuous', causality 'input'), free 
    %
    %parameters 'p' (variability 'tunable', causality 'parameter') and 
    %fixed 
    %parameters 'c' (variability 'fixed', causality 'parameter'), 
    %update 
    %variability in order to change the category. Causality is 
    %updated 
    %accordingly.
    %
    %Other changes are not permitted
    %
    %::
    %
    %  Extra doc: https://github.com/casadi/casadi/wiki/L_2c3 
    %  
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L641
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L969-L975
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1161, self, varargin{:});
    end
    function varargout = category(self,varargin)
    %CATEGORY [INTERNAL] 
    %
    %  char = CATEGORY(self, char name)
    %
    %Get the variable category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L644
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L977-L984
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1162, self, varargin{:});
    end
    function varargout = set_category(self,varargin)
    %SET_CATEGORY [INTERNAL] 
    %
    %  SET_CATEGORY(self, char name, char val)
    %
    %Set the variable category, if permitted.
    %
    %The following changes are permitted: Controls 'u' can be changed 
    %to/from 
    %tunable parameters 'p' or fixed parameters 'c' Differential 
    %states that do 
    %not appear in the right-hand-sides can be changed 
    %between regular states 
    %'x' and quadrature states 'q'
    %
    %Other changes are not permitted. Causality and variability is updated 
    %
    %accordingly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L656
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L986-L992
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1163, self, varargin{:});
    end
    function varargout = initial(self,varargin)
    %INITIAL [INTERNAL] 
    %
    %  char = INITIAL(self, char name)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L660
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L994-L996
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1164, self, varargin{:});
    end
    function varargout = set_initial(self,varargin)
    %SET_INITIAL [INTERNAL] 
    %
    %  SET_INITIAL(self, char name, char val)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L661
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L998-L1000
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1165, self, varargin{:});
    end
    function varargout = unit(self,varargin)
    %UNIT [INTERNAL] 
    %
    %  char = UNIT(self, char name)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L666
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1002-L1004
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1166, self, varargin{:});
    end
    function varargout = set_unit(self,varargin)
    %SET_UNIT [INTERNAL] 
    %
    %  SET_UNIT(self, char name, char val)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L667
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1006-L1008
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1167, self, varargin{:});
    end
    function varargout = display_unit(self,varargin)
    %DISPLAY_UNIT [INTERNAL] 
    %
    %  char = DISPLAY_UNIT(self, char name)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L672
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1010-L1012
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1168, self, varargin{:});
    end
    function varargout = set_display_unit(self,varargin)
    %SET_DISPLAY_UNIT [INTERNAL] 
    %
    %  SET_DISPLAY_UNIT(self, char name, char val)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L673
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1014-L1016
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1169, self, varargin{:});
    end
    function varargout = numel(self,varargin)
    %NUMEL [INTERNAL] 
    %
    %  int = NUMEL(self, char name)
    %
    %Get the number of elements of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L677
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1018-L1020
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1170, self, varargin{:});
    end
    function varargout = dimension(self,varargin)
    %DIMENSION [INTERNAL] 
    %
    %  [int] = DIMENSION(self, char name)
    %
    %Get the dimensions of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L680
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1022-L1024
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1171, self, varargin{:});
    end
    function varargout = start_time(self,varargin)
    %START_TIME [INTERNAL] 
    %
    %  double = START_TIME(self)
    %
    %Get the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L683
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1026-L1033
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1172, self, varargin{:});
    end
    function varargout = set_start_time(self,varargin)
    %SET_START_TIME [INTERNAL] 
    %
    %  SET_START_TIME(self, double val)
    %
    %Set the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L686
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1035-L1041
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1173, self, varargin{:});
    end
    function varargout = stop_time(self,varargin)
    %STOP_TIME [INTERNAL] 
    %
    %  double = STOP_TIME(self)
    %
    %Get the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L689
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1043-L1050
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1174, self, varargin{:});
    end
    function varargout = set_stop_time(self,varargin)
    %SET_STOP_TIME [INTERNAL] 
    %
    %  SET_STOP_TIME(self, double val)
    %
    %Set the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L692
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1052-L1058
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1175, self, varargin{:});
    end
    function varargout = tolerance(self,varargin)
    %TOLERANCE [INTERNAL] 
    %
    %  double = TOLERANCE(self)
    %
    %Get the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L695
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1060-L1067
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1176, self, varargin{:});
    end
    function varargout = set_tolerance(self,varargin)
    %SET_TOLERANCE [INTERNAL] 
    %
    %  SET_TOLERANCE(self, double val)
    %
    %Set the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L698
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1069-L1075
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1177, self, varargin{:});
    end
    function varargout = step_size(self,varargin)
    %STEP_SIZE [INTERNAL] 
    %
    %  double = STEP_SIZE(self)
    %
    %Get the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L701
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1077-L1084
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1178, self, varargin{:});
    end
    function varargout = set_step_size(self,varargin)
    %SET_STEP_SIZE [INTERNAL] 
    %
    %  SET_STEP_SIZE(self, double val)
    %
    %Set the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L704
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1086-L1092
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1179, self, varargin{:});
    end
    function varargout = attribute(self,varargin)
    %ATTRIBUTE [INTERNAL] 
    %
    %  [double] = ATTRIBUTE(self, char a, {char} name)
    %
    %Get an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L763
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1278-L1286
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1180, self, varargin{:});
    end
    function varargout = set_attribute(self,varargin)
    %SET_ATTRIBUTE [INTERNAL] 
    %
    %  SET_ATTRIBUTE(self, char a, {char} name, [double] val)
    %
    %Set an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L766
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1296-L1303
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1181, self, varargin{:});
    end
    function varargout = min(self,varargin)
    %MIN [INTERNAL] 
    %
    %  [double] = MIN(self, {char} name)
    %
    %Get the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L770
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1314-L1321
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1182, self, varargin{:});
    end
    function varargout = set_min(self,varargin)
    %SET_MIN [INTERNAL] 
    %
    %  SET_MIN(self, {char} name, [double] val)
    %
    %Set the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L773
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1331-L1337
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1183, self, varargin{:});
    end
    function varargout = max(self,varargin)
    %MAX [INTERNAL] 
    %
    %  [double] = MAX(self, {char} name)
    %
    %Get the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L776
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1348-L1355
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1184, self, varargin{:});
    end
    function varargout = set_max(self,varargin)
    %SET_MAX [INTERNAL] 
    %
    %  SET_MAX(self, {char} name, [double] val)
    %
    %Set the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L779
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1365-L1371
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1185, self, varargin{:});
    end
    function varargout = nominal(self,varargin)
    %NOMINAL [INTERNAL] 
    %
    %  [double] = NOMINAL(self, {char} name)
    %
    %Get the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L782
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1382-L1389
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1186, self, varargin{:});
    end
    function varargout = set_nominal(self,varargin)
    %SET_NOMINAL [INTERNAL] 
    %
    %  SET_NOMINAL(self, {char} name, [double] val)
    %
    %Set the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L785
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1399-L1405
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1187, self, varargin{:});
    end
    function varargout = start(self,varargin)
    %START [INTERNAL] 
    %
    %  [double] = START(self, {char} name)
    %
    %Get the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L788
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1416-L1423
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1188, self, varargin{:});
    end
    function varargout = set_start(self,varargin)
    %SET_START [INTERNAL] 
    %
    %  SET_START(self, {char} name, [double] val)
    %
    %Set the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L791
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1441-L1447
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1189, self, varargin{:});
    end
    function varargout = set(self,varargin)
    %SET [INTERNAL] 
    %
    %  SET(self, {char} name, [double] val)
    %  SET(self, {char} name, {char} val)
    %
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L797
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1481-L1488
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, {char} name, {char} val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L797
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1481-L1488
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
    %  SET(self, {char} name, [double] val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L794
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1473-L1479
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1190, self, varargin{:});
    end
    function varargout = get(self,varargin)
    %GET [INTERNAL] 
    %
    %  {GenericType} = GET(self, {char} name)
    %
    %Evaluate the values for a set of variables at the initial time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L800
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1494-L1511
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1191, self, varargin{:});
    end
    function varargout = has(self,varargin)
    %HAS [INTERNAL] 
    %
    %  bool = HAS(self, char name)
    %
    %Check if a particular variable exists.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L803
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L342-L349
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1192, self, varargin{:});
    end
    function varargout = all(self,varargin)
    %ALL [INTERNAL] 
    %
    %  {char} = ALL(self)
    %  {char} = ALL(self, char cat)
    %
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L809
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L360-L367
    %
    %
    %
    %.......
    %
    %::
    %
    %  ALL(self)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L806
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L351-L358
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
    %  ALL(self, char cat)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L809
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L360-L367
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1193, self, varargin{:});
    end
    function varargout = add_variable(self,varargin)
    %ADD_VARIABLE [INTERNAL] 
    %
    %  ADD_VARIABLE(self, MX new_v)
    %  MX = ADD_VARIABLE(self, char name, int n)
    %  MX = ADD_VARIABLE(self, char name, Sparsity sp)
    %
    %Add a new variable from symbolic expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L819
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L475-L478
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD_VARIABLE(self, MX new_v)
    %
    %
    %
    %[INTERNAL] 
    %Add a new variable from symbolic expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L819
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L475-L478
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
    %  ADD_VARIABLE(self, char name, int n)
    %
    %
    %
    %[DEPRECATED] Use add
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L813
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L465-L467
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
    %  ADD_VARIABLE(self, char name, Sparsity sp)
    %
    %
    %
    %[DEPRECATED] Use add
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L816
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L469-L473
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1194, self, varargin{:});
    end
    function varargout = add_variable_new(self,varargin)
    %ADD_VARIABLE_NEW [DEPRECATED] Use add
    %
    %  size_t = ADD_VARIABLE_NEW(self, MX new_v)
    %  size_t = ADD_VARIABLE_NEW(self, char name, int n)
    %  size_t = ADD_VARIABLE_NEW(self, char name, Sparsity sp)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L828
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L490-L494
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD_VARIABLE_NEW(self, MX new_v)
    %
    %
    %
    %[DEPRECATED] Use add
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L828
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L490-L494
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
    %  ADD_VARIABLE_NEW(self, char name, int n)
    %
    %
    %
    %[DEPRECATED] Use add
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L822
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L480-L482
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
    %  ADD_VARIABLE_NEW(self, char name, Sparsity sp)
    %
    %
    %
    %[DEPRECATED] Use add
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L825
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L484-L488
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1195, self, varargin{:});
    end
    function varargout = has_variable(self,varargin)
    %HAS_VARIABLE [DEPRECATED] Ranamed "has"
    %
    %  bool = HAS_VARIABLE(self, char name)
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L831
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L831-L831
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1196, self, varargin{:});
    end
    function varargout = all_variables(self,varargin)
    %ALL_VARIABLES [INTERNAL] 
    %
    %  {char} = ALL_VARIABLES(self)
    %
    %Get a list of all variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L834
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L834-L834
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1197, self, varargin{:});
    end
    function varargout = oracle(self,varargin)
    %ORACLE [INTERNAL] 
    %
    %  Function = ORACLE(self, bool sx, bool elim_w, bool lifted_calls)
    %
    %Get the (cached) oracle, SX or  MX.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L838
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1201-L1208
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1198, self, varargin{:});
    end
    function varargout = jac_sparsity(self,varargin)
    %JAC_SPARSITY [INTERNAL] 
    %
    %  Sparsity = JAC_SPARSITY(self, {char} onames, {char} inames)
    %
    %Get Jacobian sparsity.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L843
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1513-L1521
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1199, self, varargin{:});
    end
    function self = DaeBuilder(varargin)
    %DAEBUILDER 
    %
    %  new_obj = DAEBUILDER()
    %  new_obj = DAEBUILDER(char name, char path, struct opts)
    %
    %
    %.......
    %
    %::
    %
    %  DAEBUILDER(char name, char path, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a  DaeBuilder instance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L80
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L54-L57
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
    %  DAEBUILDER()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L77
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L51-L52
    %
    %
    %
    %.............
    %
    %
      self@casadi.SharedObject(SwigRef.Null);
      self@casadi.PrintableCommon(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1200, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1201, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
