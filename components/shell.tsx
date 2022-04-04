import { FC } from "react";

const Shell: FC = ({ children }) => {
  return (
    <div className="min-h-full">
      <div className="bg-white shadow-sm">
        <div className="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
          <div className="flex justify-between h-16">
            <div className="flex">
              <div className="flex items-center flex-shrink-0 font-extrabold">
                Small Wins
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="py-10">
        <main>
          <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">{children}</div>
        </main>
      </div>
    </div>
  );
};

export default Shell;
