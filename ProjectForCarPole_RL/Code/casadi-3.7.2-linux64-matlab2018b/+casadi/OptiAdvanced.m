classdef  OptiAdvanced < casadi.Opti
    %OPTIADVANCED [INTERNAL] C++ includes: optistack.hpp
    %
    %
    %
    %
  methods
    function delete(self)
        if self.swigPtr
          casadiMEX(1367, self);
          self.SwigClear();
        end
    end
    function varargout = solver(self,varargin)
    %SOLVER [INTERNAL] 
    %
    %  Function = SOLVER(self)
    %
    %Get the underlying CasADi solver of the  Opti stack.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L564
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L500-L506
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1368, self, varargin{:});
    end
    function varargout = is_parametric(self,varargin)
    %IS_PARAMETRIC [INTERNAL] 
    %
    %  bool = IS_PARAMETRIC(self, MX expr)
    %
    %return true if expression is only dependant on  Opti parameters,
    % not variables
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L567
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L508-L514
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1369, self, varargin{:});
    end
    function varargout = symvar(self,varargin)
    %SYMVAR [INTERNAL] 
    %
    %  {MX} = SYMVAR(self)
    %  {MX} = SYMVAR(self, MX expr)
    %  {MX} = SYMVAR(self, MX expr, casadi::VariableType type)
    %
    %Get symbols present in expression.
    %
    %Returned vector is ordered according to the order of  variable()/parameter()
    % calls used to create the variables
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L578
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L532-L538
    %
    %
    %
    %.......
    %
    %::
    %
    %  SYMVAR(self)
    %
    %
    %
    %[INTERNAL] 
    %Get symbols present in expression.
    %
    %Returned vector is ordered according to the order of  variable()/parameter()
    % calls used to create the variables
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L576
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L516-L522
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
    %  SYMVAR(self, MX expr)
    %
    %
    %
    %[INTERNAL] 
    %Get symbols present in expression.
    %
    %Returned vector is ordered according to the order of  variable()/parameter()
    % calls used to create the variables
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L577
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L524-L530
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
    %  SYMVAR(self, MX expr, casadi::VariableType type)
    %
    %
    %
    %[INTERNAL] 
    %Get symbols present in expression.
    %
    %Returned vector is ordered according to the order of  variable()/parameter()
    % calls used to create the variables
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L578
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L532-L538
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1370, self, varargin{:});
    end
    function varargout = canon_expr(self,varargin)
    %CANON_EXPR [INTERNAL] 
    %
    %  MetaCon = CANON_EXPR(self, MX expr)
    %
    %Interpret an expression (for internal use only)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L582
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L540-L546
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1371, self, varargin{:});
    end
    function varargout = get_meta(self,varargin)
    %GET_META [INTERNAL] 
    %
    %  MetaVar = GET_META(self, MX m)
    %
    %Get meta-data of symbol (for internal use only)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L585
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L548-L554
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1372, self, varargin{:});
    end
    function varargout = get_meta_con(self,varargin)
    %GET_META_CON [INTERNAL] 
    %
    %  MetaCon = GET_META_CON(self, MX m)
    %
    %Get meta-data of symbol (for internal use only)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L588
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L556-L562
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1373, self, varargin{:});
    end
    function varargout = set_meta(self,varargin)
    %SET_META [INTERNAL] 
    %
    %  SET_META(self, MX m, MetaVar meta)
    %
    %Set meta-data of an expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L591
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L564-L570
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1374, self, varargin{:});
    end
    function varargout = set_meta_con(self,varargin)
    %SET_META_CON [INTERNAL] 
    %
    %  SET_META_CON(self, MX m, MetaCon meta)
    %
    %Set meta-data of an expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L594
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L572-L578
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1375, self, varargin{:});
    end
    function varargout = assert_active_symbol(self,varargin)
    %ASSERT_ACTIVE_SYMBOL [INTERNAL] 
    %
    %  ASSERT_ACTIVE_SYMBOL(self, MX m)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1376, self, varargin{:});
    end
    function varargout = active_symvar(self,varargin)
    %ACTIVE_SYMVAR [INTERNAL] 
    %
    %  {MX} = ACTIVE_SYMVAR(self, casadi::VariableType type)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1377, self, varargin{:});
    end
    function varargout = active_values(self,varargin)
    %ACTIVE_VALUES [INTERNAL] 
    %
    %  {DM} = ACTIVE_VALUES(self, casadi::VariableType type)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1378, self, varargin{:});
    end
    function varargout = x_lookup(self,varargin)
    %X_LOOKUP [INTERNAL] 
    %
    %  MX = X_LOOKUP(self, index i)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1379, self, varargin{:});
    end
    function varargout = g_lookup(self,varargin)
    %G_LOOKUP [INTERNAL] 
    %
    %  MX = G_LOOKUP(self, index i)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1380, self, varargin{:});
    end
    function varargout = g_index_reduce_g(self,varargin)
    %G_INDEX_REDUCE_G [INTERNAL] 
    %
    %  int = G_INDEX_REDUCE_G(self, index i)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1381, self, varargin{:});
    end
    function varargout = g_index_reduce_x(self,varargin)
    %G_INDEX_REDUCE_X [INTERNAL] 
    %
    %  int = G_INDEX_REDUCE_X(self, index i)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1382, self, varargin{:});
    end
    function varargout = g_index_unreduce_g(self,varargin)
    %G_INDEX_UNREDUCE_G [INTERNAL] 
    %
    %  int = G_INDEX_UNREDUCE_G(self, index i)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1383, self, varargin{:});
    end
    function varargout = x_describe(self,varargin)
    %X_DESCRIBE [INTERNAL] 
    %
    %  char = X_DESCRIBE(self, index i, struct opts)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1384, self, varargin{:});
    end
    function varargout = g_describe(self,varargin)
    %G_DESCRIBE [INTERNAL] 
    %
    %  char = G_DESCRIBE(self, index i, struct opts)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1385, self, varargin{:});
    end
    function varargout = describe(self,varargin)
    %DESCRIBE [INTERNAL] 
    %
    %  char = DESCRIBE(self, MX x, index indent, struct opts)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1386, self, varargin{:});
    end
    function varargout = show_infeasibilities(self,varargin)
    %SHOW_INFEASIBILITIES [INTERNAL] 
    %
    %  SHOW_INFEASIBILITIES(self, double tol, struct opts)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1387, self, varargin{:});
    end
    function varargout = solve_prepare(self,varargin)
    %SOLVE_PREPARE [INTERNAL] 
    %
    %  SOLVE_PREPARE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1388, self, varargin{:});
    end
    function varargout = solve_actual(self,varargin)
    %SOLVE_ACTUAL [INTERNAL] 
    %
    %  struct:DM = SOLVE_ACTUAL(self, struct:DM args)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1389, self, varargin{:});
    end
    function varargout = arg(self,varargin)
    %ARG [INTERNAL] 
    %
    %  struct:DM = ARG(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1390, self, varargin{:});
    end
    function varargout = res(self,varargin)
    %RES [INTERNAL] 
    %
    %  struct:DM = RES(self)
    %  RES(self, struct:DM res)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1391, self, varargin{:});
    end
    function varargout = constraints(self,varargin)
    %CONSTRAINTS [INTERNAL] 
    %
    %  {MX} = CONSTRAINTS(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1392, self, varargin{:});
    end
    function varargout = objective(self,varargin)
    %OBJECTIVE [INTERNAL] 
    %
    %  MX = OBJECTIVE(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1393, self, varargin{:});
    end
    function varargout = baked_copy(self,varargin)
    %BAKED_COPY [INTERNAL] 
    %
    %  OptiAdvanced = BAKED_COPY(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1394, self, varargin{:});
    end
    function varargout = assert_empty(self,varargin)
    %ASSERT_EMPTY [INTERNAL] 
    %
    %  ASSERT_EMPTY(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1395, self, varargin{:});
    end
    function varargout = bake(self,varargin)
    %BAKE [INTERNAL] 
    %
    %  BAKE(self)
    %
    %Fix the structure of the optimization problem.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L629
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L778-L784
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1396, self, varargin{:});
    end
    function v = problem_dirty_(self)
      v = casadiMEX(1397, self);
    end
    function varargout = mark_problem_dirty(self,varargin)
    %MARK_PROBLEM_DIRTY [INTERNAL] 
    %
    %  MARK_PROBLEM_DIRTY(self, bool flag)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1398, self, varargin{:});
    end
    function varargout = problem_dirty(self,varargin)
    %PROBLEM_DIRTY [INTERNAL] 
    %
    %  bool = PROBLEM_DIRTY(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1399, self, varargin{:});
    end
    function v = solver_dirty_(self)
      v = casadiMEX(1400, self);
    end
    function varargout = mark_solver_dirty(self,varargin)
    %MARK_SOLVER_DIRTY [INTERNAL] 
    %
    %  MARK_SOLVER_DIRTY(self, bool flag)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1401, self, varargin{:});
    end
    function varargout = solver_dirty(self,varargin)
    %SOLVER_DIRTY [INTERNAL] 
    %
    %  bool = SOLVER_DIRTY(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1402, self, varargin{:});
    end
    function v = solved_(self)
      v = casadiMEX(1403, self);
    end
    function varargout = mark_solved(self,varargin)
    %MARK_SOLVED [INTERNAL] 
    %
    %  MARK_SOLVED(self, bool flag)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1404, self, varargin{:});
    end
    function varargout = solved(self,varargin)
    %SOLVED [INTERNAL] 
    %
    %  bool = SOLVED(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1405, self, varargin{:});
    end
    function varargout = assert_solved(self,varargin)
    %ASSERT_SOLVED [INTERNAL] 
    %
    %  ASSERT_SOLVED(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1406, self, varargin{:});
    end
    function varargout = assert_baked(self,varargin)
    %ASSERT_BAKED [INTERNAL] 
    %
    %  ASSERT_BAKED(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1407, self, varargin{:});
    end
    function varargout = instance_number(self,varargin)
    %INSTANCE_NUMBER [INTERNAL] 
    %
    %  int = INSTANCE_NUMBER(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1408, self, varargin{:});
    end
    function self = OptiAdvanced(varargin)
    %OPTIADVANCED 
    %
    %  new_obj = OPTIADVANCED(Opti x)
    %
    %
      self@casadi.Opti(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1409, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
  end
  methods(Static)
  end
end
