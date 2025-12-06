classdef  MX < casadi.GenericExpressionCommon & casadi.PrintableCommon & casadi.GenMX & casadi.SharedObject
    %MX [INTERNAL] 
    %
    %
    % MX -  Matrix expression.
    %
    %The  MX class is used to build up trees made up from MXNodes. It is a more 
    %
    %general graph representation than the scalar expression, SX, and much 
    %less 
    %efficient for small objects. On the other hand, the class allows 
    %much more 
    %general operations than does SX, in particular matrix valued
    % operations and
    % calls to arbitrary differentiable functions.
    %
    %The  MX class is designed to have identical syntax with the Matrix<> 
    %template
    % class, and uses DM (i.e.  Matrix<double>) as its internal 
    %representation of the values at a node. By keeping 
    %the syntaxes identical, 
    %it is possible to switch from one class to the
    % other, as well as inlining  
    %MX functions to  SXElem functions.
    %
    %Note that an operation is always "lazy", making a matrix 
    %multiplication 
    %will create a matrix multiplication node, not perform 
    %the actual 
    %multiplication.
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_py
    %
    %C++ includes: mx.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(640, self);
          self.SwigClear();
        end
    end
    function varargout = nonzero(self,varargin)
    %NONZERO [INTERNAL] 
    %
    %  bool = NONZERO(self)
    %
    %Returns the truth value of an  MX expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L200
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L143-L145
    %
    %
      [varargout{1:nargout}] = casadiMEX(641, self, varargin{:});
    end
    function varargout = sparsity(self,varargin)
    %SPARSITY [INTERNAL] 
    %
    %  Sparsity = SPARSITY(self)
    %
    %Get an owning reference to the sparsity pattern.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qd
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L205
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L205-L205
    %
    %
      [varargout{1:nargout}] = casadiMEX(642, self, varargin{:});
    end
    function varargout = nonzeros(self,varargin)
    %NONZEROS [INTERNAL] 
    %
    %  {MX} = NONZEROS(self)
    %
    %Get nonzeros as list of scalar MXes.
    %
    %Since  MX is not a containter, the scalar MXes may be complex When the 
    %
    %expression satisfies is_valid_input, the results may be simple
    %
    %For example: vertcat(x,y).nonzeros() will return {x,y}
    %
    %See: 
    %expr.nz[:]
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2bh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L220
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L610-L626
    %
    %
      [varargout{1:nargout}] = casadiMEX(643, self, varargin{:});
    end
    function varargout = erase(self,varargin)
    %ERASE [INTERNAL] 
    %
    %  ERASE(self, [int] rr, bool ind1)
    %  ERASE(self, [int] rr, [int] cc, bool ind1)
    %
    %Erase a submatrix (leaving structural zeros in its place)
    %
    %Erase elements of a matrix
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L235
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L628-L640
    %
    %
    %.......
    %
    %::
    %
    %  ERASE(self, [int] rr, bool ind1)
    %
    %
    %
    %[INTERNAL] 
    %Erase a submatrix (leaving structural zeros in its place)
    %
    %Erase elements of a matrix
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qf
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L235
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L628-L640
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ERASE(self, [int] rr, [int] cc, bool ind1)
    %
    %
    %
    %[INTERNAL] 
    %Erase a submatrix (leaving structural zeros in its place)
    %
    %Erase rows and/or columns of a matrix
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qe
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L227
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L596-L608
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(644, self, varargin{:});
    end
    function varargout = enlarge(self,varargin)
    %ENLARGE [INTERNAL] 
    %
    %  ENLARGE(self, int nrow, int ncol, [int] rr, [int] cc, bool ind1)
    %
    %Enlarge matrix.
    %
    %Make the matrix larger by inserting empty rows and columns, keeping 
    %the 
    %existing non-zeros
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L242
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L642-L650
    %
    %
      [varargout{1:nargout}] = casadiMEX(645, self, varargin{:});
    end
    function varargout = uminus(self,varargin)
    %UMINUS 
    %
    %  MX = UMINUS(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(646, self, varargin{:});
    end
    function varargout = dep(self,varargin)
    %DEP [INTERNAL] 
    %
    %  MX = DEP(self, int ch)
    %
    %Get the nth dependency as  MX.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qj
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L267
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L754-L756
    %
    %
      [varargout{1:nargout}] = casadiMEX(647, self, varargin{:});
    end
    function varargout = n_out(self,varargin)
    %N_OUT [INTERNAL] 
    %
    %  int = N_OUT(self)
    %
    %Number of outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qk
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L272
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L869-L871
    %
    %
      [varargout{1:nargout}] = casadiMEX(648, self, varargin{:});
    end
    function varargout = get_output(self,varargin)
    %GET_OUTPUT [INTERNAL] 
    %
    %  MX = GET_OUTPUT(self, int oind)
    %
    %Get an output.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_ql
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L277
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L873-L875
    %
    %
      [varargout{1:nargout}] = casadiMEX(649, self, varargin{:});
    end
    function varargout = n_dep(self,varargin)
    %N_DEP [INTERNAL] 
    %
    %  int = N_DEP(self)
    %
    %Get the number of dependencies of a binary  SXElem.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qm
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L282
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L758-L760
    %
    %
      [varargout{1:nargout}] = casadiMEX(650, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Get the name.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L285
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L762-L764
    %
    %
      [varargout{1:nargout}] = casadiMEX(651, self, varargin{:});
    end
    function varargout = to_double(self,varargin)
    %TO_DOUBLE 
    %
    %  double = TO_DOUBLE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(652, self, varargin{:});
    end
    function varargout = to_DM(self,varargin)
    %TO_DM 
    %
    %  DM = TO_DM(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(653, self, varargin{:});
    end
    function varargout = is_symbolic(self,varargin)
    %IS_SYMBOLIC [INTERNAL] 
    %
    %  bool = IS_SYMBOLIC(self)
    %
    %Check if symbolic.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L294
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L766-L768
    %
    %
      [varargout{1:nargout}] = casadiMEX(654, self, varargin{:});
    end
    function varargout = is_constant(self,varargin)
    %IS_CONSTANT [INTERNAL] 
    %
    %  bool = IS_CONSTANT(self)
    %
    %Check if constant.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L297
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L770-L772
    %
    %
      [varargout{1:nargout}] = casadiMEX(655, self, varargin{:});
    end
    function varargout = is_call(self,varargin)
    %IS_CALL [INTERNAL] 
    %
    %  bool = IS_CALL(self)
    %
    %Check if evaluation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L300
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L774-L776
    %
    %
      [varargout{1:nargout}] = casadiMEX(656, self, varargin{:});
    end
    function varargout = which_function(self,varargin)
    %WHICH_FUNCTION [INTERNAL] 
    %
    %  Function = WHICH_FUNCTION(self)
    %
    %Get function - only valid when  is_call() is true.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L303
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L778-L780
    %
    %
      [varargout{1:nargout}] = casadiMEX(657, self, varargin{:});
    end
    function varargout = is_output(self,varargin)
    %IS_OUTPUT [INTERNAL] 
    %
    %  bool = IS_OUTPUT(self)
    %
    %Check if evaluation output.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L306
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L782-L784
    %
    %
      [varargout{1:nargout}] = casadiMEX(658, self, varargin{:});
    end
    function varargout = has_output(self,varargin)
    %HAS_OUTPUT [INTERNAL] 
    %
    %  bool = HAS_OUTPUT(self)
    %
    %Check if a multiple output node.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_284
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L311
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L786-L788
    %
    %
      [varargout{1:nargout}] = casadiMEX(659, self, varargin{:});
    end
    function varargout = which_output(self,varargin)
    %WHICH_OUTPUT [INTERNAL] 
    %
    %  int = WHICH_OUTPUT(self)
    %
    %Get the index of evaluation output - only valid when  
    %is_output() is true.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L314
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L790-L792
    %
    %
      [varargout{1:nargout}] = casadiMEX(660, self, varargin{:});
    end
    function varargout = is_op(self,varargin)
    %IS_OP [INTERNAL] 
    %
    %  bool = IS_OP(self, int op)
    %
    %Is it a certain operation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L317
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L794-L796
    %
    %
      [varargout{1:nargout}] = casadiMEX(661, self, varargin{:});
    end
    function varargout = is_multiplication(self,varargin)
    %IS_MULTIPLICATION [INTERNAL] 
    %
    %  bool = IS_MULTIPLICATION(self)
    %
    %Check if multiplication.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L320
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L798-L800
    %
    %
      [varargout{1:nargout}] = casadiMEX(662, self, varargin{:});
    end
    function varargout = is_commutative(self,varargin)
    %IS_COMMUTATIVE [INTERNAL] 
    %
    %  bool = IS_COMMUTATIVE(self)
    %
    %Check if commutative operation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L323
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L850-L855
    %
    %
      [varargout{1:nargout}] = casadiMEX(663, self, varargin{:});
    end
    function varargout = is_norm(self,varargin)
    %IS_NORM [INTERNAL] 
    %
    %  bool = IS_NORM(self)
    %
    %Check if norm.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L326
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L802-L804
    %
    %
      [varargout{1:nargout}] = casadiMEX(664, self, varargin{:});
    end
    function varargout = is_valid_input(self,varargin)
    %IS_VALID_INPUT [INTERNAL] 
    %
    %  bool = IS_VALID_INPUT(self)
    %
    %Check if matrix can be used to define function inputs.
    %
    %Valid inputs for MXFunctions are combinations of Reshape, 
    %concatenations 
    %and SymbolicMX
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qn
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L333
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L925-L927
    %
    %
      [varargout{1:nargout}] = casadiMEX(665, self, varargin{:});
    end
    function varargout = n_primitives(self,varargin)
    %N_PRIMITIVES [INTERNAL] 
    %
    %  int = N_PRIMITIVES(self)
    %
    %Get the number of primitives for MXFunction inputs/outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qo
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L929-L931
    %
    %
      [varargout{1:nargout}] = casadiMEX(666, self, varargin{:});
    end
    function varargout = primitives(self,varargin)
    %PRIMITIVES [INTERNAL] 
    %
    %  {MX} = PRIMITIVES(self)
    %
    %Get primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qp
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L343
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L933-L939
    %
    %
      [varargout{1:nargout}] = casadiMEX(667, self, varargin{:});
    end
    function varargout = split_primitives(self,varargin)
    %SPLIT_PRIMITIVES [INTERNAL] 
    %
    %  {DM} = SPLIT_PRIMITIVES(self, DM x)
    %  {SX} = SPLIT_PRIMITIVES(self, SX x)
    %  {MX} = SPLIT_PRIMITIVES(self, MX x)
    %
    %Split up an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L351
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L957-L963
    %
    %
    %.......
    %
    %::
    %
    %  SPLIT_PRIMITIVES(self, DM x)
    %
    %
    %
    %[INTERNAL] 
    %Split up an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L351
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L957-L963
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SPLIT_PRIMITIVES(self, SX x)
    %
    %
    %
    %[INTERNAL] 
    %Split up an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L350
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L949-L955
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SPLIT_PRIMITIVES(self, MX x)
    %
    %
    %
    %[INTERNAL] 
    %Split up an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qq
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L349
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L941-L947
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(668, self, varargin{:});
    end
    function varargout = join_primitives(self,varargin)
    %JOIN_PRIMITIVES [INTERNAL] 
    %
    %  DM = JOIN_PRIMITIVES(self, {DM} v)
    %  SX = JOIN_PRIMITIVES(self, {SX} v)
    %  MX = JOIN_PRIMITIVES(self, {MX} v)
    %
    %Join an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L360
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L981-L987
    %
    %
    %.......
    %
    %::
    %
    %  JOIN_PRIMITIVES(self, {DM} v)
    %
    %
    %
    %[INTERNAL] 
    %Join an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L360
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L981-L987
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  JOIN_PRIMITIVES(self, {SX} v)
    %
    %
    %
    %[INTERNAL] 
    %Join an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L359
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L973-L979
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  JOIN_PRIMITIVES(self, {MX} v)
    %
    %
    %
    %[INTERNAL] 
    %Join an expression along symbolic primitives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qr
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L358
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L965-L971
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(669, self, varargin{:});
    end
    function varargout = has_duplicates(self,varargin)
    %HAS_DUPLICATES 
    %
    %  bool = HAS_DUPLICATES(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(670, self, varargin{:});
    end
    function varargout = reset_input(self,varargin)
    %RESET_INPUT 
    %
    %  RESET_INPUT(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(671, self, varargin{:});
    end
    function varargout = is_eye(self,varargin)
    %IS_EYE [INTERNAL] 
    %
    %  bool = IS_EYE(self)
    %
    %check if identity
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qu
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L383
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L997-L999
    %
    %
      [varargout{1:nargout}] = casadiMEX(672, self, varargin{:});
    end
    function varargout = is_zero(self,varargin)
    %IS_ZERO [INTERNAL] 
    %
    %  bool = IS_ZERO(self)
    %
    %check if zero (note that false negative answers are possible)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qv
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L388
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1001-L1007
    %
    %
      [varargout{1:nargout}] = casadiMEX(673, self, varargin{:});
    end
    function varargout = is_one(self,varargin)
    %IS_ONE [INTERNAL] 
    %
    %  bool = IS_ONE(self)
    %
    %check if zero (note that false negative answers are possible)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qw
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L393
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1009-L1011
    %
    %
      [varargout{1:nargout}] = casadiMEX(674, self, varargin{:});
    end
    function varargout = is_minus_one(self,varargin)
    %IS_MINUS_ONE [INTERNAL] 
    %
    %  bool = IS_MINUS_ONE(self)
    %
    %check if zero (note that false negative answers are possible)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qx
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L398
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1013-L1015
    %
    %
      [varargout{1:nargout}] = casadiMEX(675, self, varargin{:});
    end
    function varargout = is_transpose(self,varargin)
    %IS_TRANSPOSE [INTERNAL] 
    %
    %  bool = IS_TRANSPOSE(self)
    %
    %Is the expression a transpose?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qy
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L403
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1017-L1019
    %
    %
      [varargout{1:nargout}] = casadiMEX(676, self, varargin{:});
    end
    function varargout = is_regular(self,varargin)
    %IS_REGULAR [INTERNAL] 
    %
    %  bool = IS_REGULAR(self)
    %
    %Checks if expression does not contain NaN or Inf.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L406
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1021-L1027
    %
    %
      [varargout{1:nargout}] = casadiMEX(677, self, varargin{:});
    end
    function varargout = is_binary(self,varargin)
    %IS_BINARY [INTERNAL] 
    %
    %  bool = IS_BINARY(self)
    %
    %Is binary operation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L409
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L814-L816
    %
    %
      [varargout{1:nargout}] = casadiMEX(678, self, varargin{:});
    end
    function varargout = is_unary(self,varargin)
    %IS_UNARY [INTERNAL] 
    %
    %  bool = IS_UNARY(self)
    %
    %Is unary operation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L412
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L818-L820
    %
    %
      [varargout{1:nargout}] = casadiMEX(679, self, varargin{:});
    end
    function varargout = op(self,varargin)
    %OP [INTERNAL] 
    %
    %  int = OP(self)
    %
    %Get operation type.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L415
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L822-L824
    %
    %
      [varargout{1:nargout}] = casadiMEX(680, self, varargin{:});
    end
    function varargout = info(self,varargin)
    %INFO [INTERNAL] 
    %
    %  struct = INFO(self)
    %
    %Obtain information about node
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L418
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L826-L828
    %
    %
      [varargout{1:nargout}] = casadiMEX(681, self, varargin{:});
    end
    function varargout = serialize(self,varargin)
    %SERIALIZE [INTERNAL] 
    %
    %  SERIALIZE(self, casadi::SerializingStream & s)
    %
    %Serialize an object.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_qz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L423
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L830-L832
    %
    %
      [varargout{1:nargout}] = casadiMEX(682, self, varargin{:});
    end
    function varargout = get_temp(self,varargin)
    %GET_TEMP 
    %
    %  int = GET_TEMP(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(684, self, varargin{:});
    end
    function varargout = set_temp(self,varargin)
    %SET_TEMP 
    %
    %  SET_TEMP(self, int t)
    %
    %
      [varargout{1:nargout}] = casadiMEX(685, self, varargin{:});
    end
    function varargout = get(self,varargin)
    %GET [INTERNAL] 
    %
    %  MX = GET(self, bool ind1, int rr)
    %  MX = GET(self, bool ind1, Sparsity sp)
    %  MX = GET(self, bool ind1, Slice rr)
    %  MX = GET(self, bool ind1, IM rr)
    %  MX = GET(self, bool ind1, MX rr)
    %  MX = GET(self, bool ind1, int rr, int cc)
    %  MX = GET(self, bool ind1, int rr, Slice cc)
    %  MX = GET(self, bool ind1, Slice rr, int cc)
    %  MX = GET(self, bool ind1, Slice rr, Slice cc)
    %  MX = GET(self, bool ind1, Slice rr, IM cc)
    %  MX = GET(self, bool ind1, Slice rr, MX cc)
    %  MX = GET(self, bool ind1, IM rr, Slice cc)
    %  MX = GET(self, bool ind1, IM rr, IM cc)
    %  MX = GET(self, bool ind1, MX rr, Slice cc)
    %  MX = GET(self, bool ind1, MX rr, MX cc)
    %
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L504
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L224-L227
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, IM rr)
    %  GET(self, bool ind1, Slice rr, IM cc)
    %  GET(self, bool ind1, IM rr, Slice cc)
    %  GET(self, bool ind1, IM rr, IM cc)
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
    %  GET(self, bool ind1, int rr)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L480
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L480-L482
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L478
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L200-L206
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, Slice rr)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L476
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L177-L180
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, MX rr)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L479
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L208-L212
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, int rr, int cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L498
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L498-L501
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, int rr, Slice cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L493
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L493-L495
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, Slice rr, int cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L489
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L489-L491
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, Slice rr, Slice cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L487
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L147-L150
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, Slice rr, MX cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L503
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L214-L217
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, MX rr, Slice cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L502
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L219-L222
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET(self, bool ind1, MX rr, MX cc)
    %
    %
    %
    %[INTERNAL] 
    %Get a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L504
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L224-L227
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(691, self, varargin{:});
    end
    function varargout = set(self,varargin)
    %SET 
    %
    %  SET(self, MX m, bool ind1, Sparsity sp)
    %  SET(self, MX m, bool ind1, Slice rr)
    %  SET(self, MX m, bool ind1, IM rr)
    %  SET(self, MX m, bool ind1, Slice rr, Slice cc)
    %  SET(self, MX m, bool ind1, Slice rr, IM cc)
    %  SET(self, MX m, bool ind1, IM rr, Slice cc)
    %  SET(self, MX m, bool ind1, IM rr, IM cc)
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, MX m, bool ind1, IM rr)
    %  SET(self, MX m, bool ind1, Slice rr, IM cc)
    %  SET(self, MX m, bool ind1, IM rr, Slice cc)
    %  SET(self, MX m, bool ind1, IM rr, IM cc)
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
    %  SET(self, MX m, bool ind1, Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Set a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L511
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L377-L388
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, MX m, bool ind1, Slice rr)
    %
    %
    %
    %[INTERNAL] 
    %Set a submatrix, single argument
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L509
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L304-L307
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, MX m, bool ind1, Slice rr, Slice cc)
    %
    %
    %
    %[INTERNAL] 
    %Set a submatrix, two arguments
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L516
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L229-L232
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(692, self, varargin{:});
    end
    function varargout = get_nz(self,varargin)
    %GET_NZ [INTERNAL] 
    %
    %  MX = GET_NZ(self, bool ind1, int kk)
    %  MX = GET_NZ(self, bool ind1, Slice kk)
    %  MX = GET_NZ(self, bool ind1, IM kk)
    %  MX = GET_NZ(self, bool ind1, MX kk)
    %  MX = GET_NZ(self, bool ind1, Slice inner, MX outer)
    %  MX = GET_NZ(self, bool ind1, MX inner, Slice outer)
    %  MX = GET_NZ(self, bool ind1, MX inner, MX outer)
    %
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L532
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L433-L436
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, IM kk)
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
    %  GET_NZ(self, bool ind1, int kk)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L527
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L527-L529
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, Slice kk)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L524
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L390-L393
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, MX kk)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L526
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L428-L431
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, Slice inner, MX outer)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L531
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L438-L441
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, MX inner, Slice outer)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L530
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L443-L446
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  GET_NZ(self, bool ind1, MX inner, MX outer)
    %
    %
    %
    %[INTERNAL] 
    %Get a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L532
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L433-L436
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(693, self, varargin{:});
    end
    function varargout = set_nz(self,varargin)
    %SET_NZ [INTERNAL] 
    %
    %  SET_NZ(self, MX m, bool ind1, int kk)
    %  SET_NZ(self, MX m, bool ind1, Slice kk)
    %  SET_NZ(self, MX m, bool ind1, IM kk)
    %  SET_NZ(self, MX m, bool ind1, MX kk)
    %
    %Set a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L540
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L540-L540
    %
    %
    %.......
    %
    %::
    %
    %  SET_NZ(self, MX m, bool ind1, IM kk)
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
    %  SET_NZ(self, MX m, bool ind1, int kk)
    %
    %
    %
    %[INTERNAL] 
    %Set a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L540
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L540-L540
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET_NZ(self, MX m, bool ind1, Slice kk)
    %
    %
    %
    %[INTERNAL] 
    %Set a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L537
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L448-L451
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET_NZ(self, MX m, bool ind1, MX kk)
    %
    %
    %
    %[INTERNAL] 
    %Set a set of nonzeros
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L539
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L509-L511
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(694, self, varargin{:});
    end
    function varargout = printme(self,varargin)
    %PRINTME [INTERNAL] 
    %
    %  MX = PRINTME(self, MX b)
    %
    %
      [varargout{1:nargout}] = casadiMEX(698, self, varargin{:});
    end
    function varargout = attachAssert(self,varargin)
    %ATTACHASSERT [INTERNAL] 
    %
    %  MX = ATTACHASSERT(self, MX y, char fail_message)
    %
    %returns itself, but with an assertion attached
    %
    %If y does not evaluate to 1, a runtime error is raised
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_rg
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L923
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L723-L728
    %
    %
      [varargout{1:nargout}] = casadiMEX(699, self, varargin{:});
    end
    function varargout = monitor(self,varargin)
    %MONITOR [INTERNAL] 
    %
    %  MX = MONITOR(self, char comment)
    %
    %Monitor an expression.
    %
    %Returns itself, but with the side effect of printing the nonzeros 
    %along 
    %with a comment
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_rh
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L930
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L730-L732
    %
    %
      [varargout{1:nargout}] = casadiMEX(700, self, varargin{:});
    end
    function varargout = T(self,varargin)
    %T [INTERNAL] 
    %
    %  MX = T(self)
    %
    %Transpose the matrix.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L933
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L1029-L1031
    %
    %
      [varargout{1:nargout}] = casadiMEX(701, self, varargin{:});
    end
    function varargout = mapping(self,varargin)
    %MAPPING [INTERNAL] 
    %
    %  IM = MAPPING(self)
    %
    %Get an IM representation of a GetNonzeros or SetNonzeros node.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_ri
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L938
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L857-L859
    %
    %
      [varargout{1:nargout}] = casadiMEX(702, self, varargin{:});
    end
    function varargout = eval_mx(self,varargin)
    %EVAL_MX [INTERNAL] 
    %
    %  {MX} = EVAL_MX(self, {MX} arg)
    %
    %Evaluate the  MX node with new symbolic dependencies.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_rn
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L969
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L2736-L2743
    %
    %
      [varargout{1:nargout}] = casadiMEX(708, self, varargin{:});
    end
    function varargout = paren_asgn(self,varargin)
    %PAREN_ASGN 
    %
    %  PAREN_ASGN(self, MX m, Sparsity sp)
    %  PAREN_ASGN(self, MX m, IM rr)
    %  PAREN_ASGN(self, MX m, char rr)
    %  PAREN_ASGN(self, MX m, IM rr, IM cc)
    %  PAREN_ASGN(self, MX m, IM rr, char cc)
    %  PAREN_ASGN(self, MX m, char rr, IM cc)
    %  PAREN_ASGN(self, MX m, char rr, char cc)
    %
    %
      [varargout{1:nargout}] = casadiMEX(709, self, varargin{:});
    end
    function varargout = setbrace(self,varargin)
    %SETBRACE 
    %
    %  SETBRACE(self, MX m, IM rr)
    %  SETBRACE(self, MX m, char rr)
    %
    %
      [varargout{1:nargout}] = casadiMEX(710, self, varargin{:});
    end
    function varargout = end(self,varargin)
    %END 
    %
    %  int = END(self, int i, int n)
    %
    %
      [varargout{1:nargout}] = casadiMEX(711, self, varargin{:});
    end
    function varargout = ctranspose(self,varargin)
    %CTRANSPOSE 
    %
    %  MX = CTRANSPOSE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(712, self, varargin{:});
    end
    function varargout = find(varargin)
    %FIND Find first nonzero, returned as row index.
    %
    %  MX = FIND(MX x)
    %
    %
    %If failed, returns the number of rows
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r7
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L748
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L748-L750
    %
    %
     [varargout{1:nargout}] = casadiMEX(713, varargin{:});
    end
    function varargout = low(varargin)
    %LOW Find first nonzero.
    %
    %  MX = LOW(MX v, MX p, struct options)
    %
    %
    %If failed, returns the number of rows
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r8
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L757
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L757-L759
    %
    %
     [varargout{1:nargout}] = casadiMEX(714, varargin{:});
    end
    function varargout = inv_node(varargin)
    %INV_NODE Inverse node.
    %
    %  MX = INV_NODE(MX x)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_re
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L864
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L864-L866
    %
    %
     [varargout{1:nargout}] = casadiMEX(715, varargin{:});
    end
    function varargout = brace(self,varargin)
    %BRACE 
    %
    %  MX = BRACE(self, IM rr)
    %  MX = BRACE(self, MX rr)
    %  MX = BRACE(self, char rr)
    %
    %
      [varargout{1:nargout}] = casadiMEX(716, self, varargin{:});
    end
    function varargout = brace_asgn(self,varargin)
    %BRACE_ASGN 
    %
    %  BRACE_ASGN(self, MX m, MX rr)
    %
    %
      [varargout{1:nargout}] = casadiMEX(717, self, varargin{:});
    end
    function varargout = paren(self,varargin)
    %PAREN 
    %
    %  MX = PAREN(self, Sparsity sp)
    %  MX = PAREN(self, IM rr)
    %  MX = PAREN(self, MX rr)
    %  MX = PAREN(self, char rr)
    %  MX = PAREN(self, IM rr, IM cc)
    %  MX = PAREN(self, IM rr, char cc)
    %  MX = PAREN(self, MX rr, MX cc)
    %  MX = PAREN(self, MX rr, char cc)
    %  MX = PAREN(self, char rr, IM cc)
    %  MX = PAREN(self, char rr, MX cc)
    %  MX = PAREN(self, char rr, char cc)
    %
    %
      [varargout{1:nargout}] = casadiMEX(718, self, varargin{:});
    end
    function varargout = numel(self,varargin)
    %NUMEL 
    %
    %  int = NUMEL(self)
    %  int = NUMEL(self, int k)
    %  int = NUMEL(self, [int] k)
    %  int = NUMEL(self, MX k)
    %  int = NUMEL(self, char rr)
    %
    %
    %.......
    %
    %::
    %
    %  NUMEL(self, int k)
    %  NUMEL(self, [int] k)
    %  NUMEL(self, MX k)
    %  NUMEL(self, char rr)
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
    %  NUMEL(self)
    %
    %
    %
    %[INTERNAL] 
    %Get the number of elements.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ar
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L104
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_matrix.hpp#L1318-L1320
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(719, self, varargin{:});
    end
    function self = MX(varargin)
    %MX 
    %
    %  new_obj = MX()
    %  new_obj = MX(Sparsity sp)
    %  new_obj = MX(double x)
    %  new_obj = MX(DM x)
    %  new_obj = MX(int nrow, int ncol)
    %  new_obj = MX(Sparsity sp, MX val)
    %  new_obj = MX(Sparsity sp, char fname)
    %  new_obj = MX(DM val, char name)
    %
    %
    %.......
    %
    %::
    %
    %  MX(DM x)
    %  MX(DM val, char name)
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
    %  MX()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L102
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L59-L61
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MX(int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %Create a sparse matrix with all structural zeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L107
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L108-L110
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MX(Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %Create a sparse matrix from a sparsity pattern.
    %
    %Same as MX::ones(sparsity)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L121
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L104-L106
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MX(double x)
    %
    %
    %
    %[INTERNAL] 
    %Create scalar constant (also implicit type conversion)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L144
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L71-L73
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MX(Sparsity sp, MX val)
    %
    %
    %
    %[INTERNAL] 
    %Construct matrix with a given sparsity and nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L126
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L83-L102
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  MX(Sparsity sp, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Construct matrix with a given sparsity and a file with nonzeros.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_q5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L120-L122
    %
    %
    %.............
    %
    %
      self@casadi.GenericExpressionCommon(SwigRef.Null);
      self@casadi.PrintableCommon(SwigRef.Null);
      self@casadi.GenMX(SwigRef.Null);
      self@casadi.SharedObject(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(720, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
  end
  methods(Static)
    function varargout = type_name(varargin)
    %TYPE_NAME 
    %
    %  char = TYPE_NAME()
    %
    %
     [varargout{1:nargout}] = casadiMEX(639, varargin{:});
    end
    function varargout = deserialize(varargin)
    %DESERIALIZE 
    %
    %  MX = DESERIALIZE(casadi::DeserializingStream & s)
    %
    %
     [varargout{1:nargout}] = casadiMEX(683, varargin{:});
    end
    function varargout = binary(varargin)
    %BINARY [INTERNAL] 
    %
    %  MX = BINARY(int op, MX x, MX y)
    %
    %Create nodes by their ID.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L442
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L513-L538
    %
    %
     [varargout{1:nargout}] = casadiMEX(686, varargin{:});
    end
    function varargout = unary(varargin)
    %UNARY [INTERNAL] 
    %
    %  MX = UNARY(int op, MX x)
    %
    %Create nodes by their ID.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L443
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L540-L542
    %
    %
     [varargout{1:nargout}] = casadiMEX(687, varargin{:});
    end
    function varargout = inf(varargin)
    %INF [INTERNAL] 
    %
    %  MX = INF(int nrow, int ncol)
    %  MX = INF([int,int] rc)
    %  MX = INF(Sparsity sp)
    %
    %create a matrix with all inf
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L452
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L560-L562
    %
    %
    %.......
    %
    %::
    %
    %  INF(int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all inf
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L451
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L556-L558
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INF([int,int] rc)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all inf
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L452
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L560-L562
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  INF(Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all inf
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L450
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L564-L566
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(688, varargin{:});
    end
    function varargout = nan(varargin)
    %NAN [INTERNAL] 
    %
    %  MX = NAN(int nrow, int ncol)
    %  MX = NAN([int,int] rc)
    %  MX = NAN(Sparsity sp)
    %
    %create a matrix with all nan
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L461
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L572-L574
    %
    %
    %.......
    %
    %::
    %
    %  NAN(int nrow, int ncol)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all nan
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L460
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L568-L570
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  NAN([int,int] rc)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all nan
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L461
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L572-L574
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  NAN(Sparsity sp)
    %
    %
    %
    %[INTERNAL] 
    %create a matrix with all nan
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r3
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L459
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L576-L578
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(689, varargin{:});
    end
    function varargout = eye(varargin)
    %EYE 
    %
    %  MX = EYE(int n)
    %
    %
     [varargout{1:nargout}] = casadiMEX(690, varargin{:});
    end
    function varargout = einstein(varargin)
    %EINSTEIN [INTERNAL] 
    %
    %  MX = EINSTEIN(MX A, MX B, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %  MX = EINSTEIN(MX A, MX B, MX C, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %
    %Computes an einstein dense tensor contraction.
    %
    %Computes the product: C_c = A_a + B_b where a b c are index/einstein 
    %
    %notation in an encoded form
    %
    %For example, an matrix-matrix product may be written as: C_ij = A_ik 
    %B_kj
    %
    %The encoded form uses strictly negative numbers to indicate labels. 
    %For the
    % above example, we would have: a {-1, -3} b {-3, -2} c {-1 -2}
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L564
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L670-L676
    %
    %
    %.......
    %
    %::
    %
    %  EINSTEIN(MX A, MX B, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %
    %
    %
    %[INTERNAL] 
    %Computes an einstein dense tensor contraction.
    %
    %Computes the product: C_c = A_a + B_b where a b c are index/einstein 
    %
    %notation in an encoded form
    %
    %For example, an matrix-matrix product may be written as: C_ij = A_ik 
    %B_kj
    %
    %The encoded form uses strictly negative numbers to indicate labels. 
    %For the
    % above example, we would have: a {-1, -3} b {-3, -2} c {-1 -2}
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L564
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L670-L676
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  EINSTEIN(MX A, MX B, MX C, [int] dim_a, [int] dim_b, [int] dim_c, [int] a, [int] b, [int] c)
    %
    %
    %
    %[INTERNAL] 
    %Computes an einstein dense tensor contraction.
    %
    %Computes the product: C_c = A_a + B_b where a b c are index/einstein 
    %
    %notation in an encoded form
    %
    %For example, an matrix-matrix product may be written as: C_ij = A_ik 
    %B_kj
    %
    %The encoded form uses strictly negative numbers to indicate labels. 
    %For the
    % above example, we would have: a {-1, -3} b {-3, -2} c {-1 -2}
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_r5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L558
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.cpp#L662-L668
    %
    %
    %.............
    %
    %
     [varargout{1:nargout}] = casadiMEX(695, varargin{:});
    end
    function varargout = bspline_dual(varargin)
    %BSPLINE_DUAL [INTERNAL] 
    %
    %  DM = BSPLINE_DUAL([double] x, {[double]} knots, [int] degree, struct opts)
    %
    %
     [varargout{1:nargout}] = casadiMEX(696, varargin{:});
    end
    function varargout = interpn_linear(varargin)
    %INTERPN_LINEAR 
    %
    %  MX = INTERPN_LINEAR({MX} x, MX v, {MX} xq, struct opts)
    %
    %
     [varargout{1:nargout}] = casadiMEX(697, varargin{:});
    end
    function varargout = set_max_depth(varargin)
    %SET_MAX_DEPTH 
    %
    %  SET_MAX_DEPTH(int eq_depth)
    %
    %
     [varargout{1:nargout}] = casadiMEX(703, varargin{:});
    end
    function varargout = get_max_depth(varargin)
    %GET_MAX_DEPTH 
    %
    %  int = GET_MAX_DEPTH()
    %
    %
     [varargout{1:nargout}] = casadiMEX(704, varargin{:});
    end
    function varargout = test_cast(varargin)
    %TEST_CAST 
    %
    %  bool = TEST_CAST(casadi::SharedObjectInternal const * ptr)
    %
    %
     [varargout{1:nargout}] = casadiMEX(705, varargin{:});
    end
    function varargout = get_input(varargin)
    %GET_INPUT 
    %
    %  {MX} = GET_INPUT(Function f)
    %
    %
     [varargout{1:nargout}] = casadiMEX(706, varargin{:});
    end
    function varargout = get_free(varargin)
    %GET_FREE 
    %
    %  {MX} = GET_FREE(Function f)
    %
    %
     [varargout{1:nargout}] = casadiMEX(707, varargin{:});
    end
  end
end
